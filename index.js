require('dotenv').config()

const express = require('express')
const helmet = require('helmet');
const morgan = require('morgan');

const { DBTest } = require('./database.js');
const foroModel = require('./foroModel.js');

const app = express()
const PUERTO = process.env.PUERTO

// Configurar EJS como motor de plantilla
app.set('view engine', 'ejs');

// Middlewares
app.use(helmet({ contentSecurityPolicy: false }));
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', async function (req, res) {
    const forop = await foroModel.findAll();

    res.render('inicio', { forop: forop });
})

app.get('/agregar', function (req, res) {
    res.render('agregar')
})

app.post('/agregar', async function (req, res) {
    //const foro = req.body.foro
    //const descripcion = req.body.descripcion
    const { titulo, descripcion, fecha, imagen } = req.body

    try {
        const nuevaForo = await foroModel.create({
            titulo: titulo,
            descripcion: descripcion,
            fecha: fecha,
            imagen: imagen
        });

        if (nuevaForo) {
            res.redirect('/');
        } else {
            res.send('No se pudo agregar el post :(')
        }
    } catch (err) {
        res.send('Se produjo un error al cargar el post: ' + err)
    }
})

app.get('/eliminar/:id', async function (req, res) {
    const { id } = req.params;

    try {
        const borrarForo = await foroModel.destroy({
            where: {
                id: id
            }
        })

        if (borrarForo) {
            res.redirect('/');
        } else {
            res.send('No se pudo borrar el post :(')
        }
    } catch (err) {
        res.send('Se produjo un error al borrar el post: ' + err)
    }
})

app.get('/editar/:id', async function (req, res) {
    const { id } = req.params;

    try {
        const foro = await foroModel.findOne({
            where: {
                id: id
            }
        })

        if (foro) {
            res.render('editar', { foro: foro });
        } else {
            res.send('No se pudo encontrar el post :(')
        }
    } catch (err) {
        res.send('Se produjo un error al buscar el post: ' + err)
    }
})

app.post('/editar/:id', async function (req, res) {
    const { id } = req.params;
    const { foro, descripcion, imagen } = req.body

    try {
        const foroActualizada = await foroModel.update(
            {
                titulo: foro,
                descripcion: descripcion,
                imagen: imagen
            }, {
                where: {
                    id: id
                }
            }
        )
        
        if (foroActualizada) {
            res.redirect('/');
        } else {
            res.send('No se pudo actualizar el post :(')
        }
    } catch (err) {
        res.send('Se produjo un error al actualizar el post: ' + err)
    }
})

DBTest()

app.listen(PUERTO, () => {
    console.log(`El servidor está corriendo en el puerto ${PUERTO}`)
})
