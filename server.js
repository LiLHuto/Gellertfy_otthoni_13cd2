const express = require("express");
const mysql = require("mysql");
const app = express();
const cors = require("cors");
const bodyParser = require("body-parser");

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
    user: "root",
    host: "127.0.0.1",
    password: "",
    database: "atletikavb2017",
});


app.get("/", (req, res) => {
    res.send("A szerver működik!");
});





app.get("/60perc", (req, res) => {
    const query = `
        SELECT DISTINCT Versenyszam 
        FROM versenyekszamok 
        WHERE Eredmeny LIKE '%:%:%' 
        AND (
            SUBSTRING_INDEX(Eredmeny, ':', 1) > 1 
            OR (
                SUBSTRING_INDEX(Eredmeny, ':', 1) = 1 
                AND SUBSTRING_INDEX(SUBSTRING_INDEX(Eredmeny, ':', 2), ':', -1) > 0
            )
        )
    `;
    
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results);
    });
});


app.delete("nemzettorles", (req, res) => {
    const nationId = req.params.id;
    const checkQuery = "SELECT COUNT(*) as count FROM versenyekszamok WHERE NemzetKod = ?";
    
    db.query(checkQuery, [nationId], (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        
        if (results[0].count > 0) {
            return res.status(400).json({ 
                error: "Nem lehet törölni olyan nemzetet, amelynek vannak versenyzői" 
            });
        }

        const deleteQuery = "DELETE FROM nemzetek WHERE NemzetId = ?";
        
        db.query(deleteQuery, [nationId], (err, result) => {
            if (err) {
                return res.status(500).json({ error: err.message });
            }
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: "A nemzet nem található" });
            }
            res.json({ message: "Nemzet sikeresen törölve" });
        });
    });
});

app.post("/ujnemzet", (req, res) => {
    const { Nemzet } = req.body;
    
    if (!Nemzet) {
        return res.status(400).json({ error: "A nemzet neve kötelező" });
    }

    const query = "INSERT INTO nemzetek (Nemzet) VALUES (?)";
    
    db.query(query, [Nemzet], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ 
            message: "Nemzet sikeresen hozzáadva",
            NemzetId: result.insertId,
            Nemzet: Nemzet 
        });
    });
});


app.put("/nemzeteredmeny", (req, res) => {
    const { nationId, event } = req.params;
    const { Eredmeny } = req.body;

    if (!Eredmeny) {
        return res.status(400).json({ error: "Az eredmény megadása kötelező" });
    }

    const query = `
        UPDATE versenyekszamok 
        SET Eredmeny = ? 
        WHERE NemzetKod = ? 
        AND Versenyszam = ?
    `;
    
    db.query(query, [Eredmeny, nationId, event], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ 
                error: "Nem található rekord ehhez a nemzethez és versenyszámhoz" 
            });
        }
        res.json({ 
            message: "Eredmény sikeresen frissítve",
            updatedRows: result.affectedRows 
        });
    });
});

app.listen(3000, () => {
    console.log("A szerver a 3000 porton fut!");
});