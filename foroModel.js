//model del foro

const { DataTypes } = require('sequelize');
const { sequelize } = require('./database.js');

const Foro = sequelize.define('Foro', {
    titulo: {
        type: DataTypes.STRING,
    },
    descripcion: {
        type: DataTypes.STRING,
    },
    fecha: {
        type: DataTypes.DATEONLY,
    },
    imagen: {
        type: DataTypes.STRING(500),
        allowNull: true,
    },
}, {
    timestamps: false,
    tableName: 'forop',
});

module.exports = Foro;