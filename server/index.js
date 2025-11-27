import 'dotenv/config';
import express from 'express';
import sequelize from "./db.js";
import models from './models/models.js';

const app = express();
const PORT = process.env.PORT || 5222; // Добавь значение по умолчанию

// Middleware для парсинга JSON
app.use(express.json());


const start = async () => {
    try {
        app.listen(PORT, () => {
        console.log(`Сервер работает на порту ${PORT}`);
        });
        
        await sequelize.authenticate();
        console.log('Подключение к БД ~ успешно');
        
        await sequelize.sync({ force: true }); // force: true пересоздает таблицы
        console.log('Таблицы синхронизированы');
    } catch (error) {
        console.error('Не удалось подключиться к БД:', error);
    }
}

start();