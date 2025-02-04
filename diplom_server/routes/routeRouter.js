const express = require('express');
const router = express.Router();
const {
    createRoute,
    updateRoute,
    getRouteById,
    deleteRoute,
    markPointAsVisited,
    addToFavorites,
    finishRoute,
    createCategory,
    getAllCategories,
    deleteCategory
} = require('../controllers/routeController');

// Создание маршрута
router.post('/routes', createRoute);

// Обновление маршрута
router.put('/routes/:id', updateRoute);

// Получить маршрут по ID
router.get('/routes/:id', getRouteById);

// Удалить маршрут
router.delete('/routes/:id', deleteRoute);

// Отметить точку как посещенную
router.put('/routes/mark-visited', markPointAsVisited);

// Добавить маршрут в избранное
router.post('/routes/add-favorite', addToFavorites);

// Завершить маршрут
router.put('/routes/finish', finishRoute);

// Создание категории маршрута
router.post('/categories', createCategory);

// Получить все категории маршрутов
router.get('/categories', getAllCategories);

// Удалить категорию
router.delete('/categories/:id', deleteCategory);

module.exports = router;
