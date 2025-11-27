import { DataTypes } from "sequelize";
import sequelize from "../db.js";
import { Sequelize } from "sequelize";

const Application = sequelize.define('applications', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    group: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    speciality: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    code_speciality: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    birthday: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    course: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    form_of_education: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    form_of_practice: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    type_of_practice: {
        type: DataTypes.STRING,
        allowNull: true,
    },
    date_start: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    date_end: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    organization_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ceo_organization_name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    manager_of_practice: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    created_at: {
        type: DataTypes.DATE,
        defaultValue: Sequelize.NOW
    }
}, {
    timestamps: false,
});

export default { Application }