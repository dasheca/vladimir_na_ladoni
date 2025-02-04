const { Routes, Routes_Items,  User_Route, Categories_Routes } = require('../models/models');
const { Op } = require('sequelize');
const uuid = require('uuid');
const path = require('path')

const createRoute = async (req, res) => {
    try {
      const { title, description, document, userId, is_published, categoryId, routesItems } = req.body;
      const { image } = req.files;
  
      if (!image) {
        return res.status(400).json({ message: 'Фото обязательно для загрузки' });
      }
  
      let fileName = uuid.v4() + ".jpg";
      image.mv(path.resolve(__dirname, '../../diplom_client/public', 'static', fileName));
  
      // Сохранение маршрута
      const route = await Routes.create({
        title, description, image: fileName, document, userId, is_published, categoryId
      });
  
      // Проверка, что routesItems есть и он не пустой
      if (routesItems && Array.isArray(routesItems) && routesItems.length > 0) {
        // Перебор элементов массива и сохранение их в Routes_Items
        for (const item of routesItems) {
          await Routes_Items.create({
            route_id: route.id, // Связываем точку с маршрутом
            attraction_id: item.attraction_id, // Достопримечательность
            position: item.position, // Позиция в маршруте
            isVisited: item.isVisited || false // Статус посещения
          });
        }
      }
  
      res.status(201).json(route);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
  
const getRouteById = async (req, res) => {
        try {
            const { id } = req.params;
            const route = await Routes.findByPk(id);
            if (!route) return res.status(404).json({ error: 'Route not found' });
            res.json(route);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const updateRoute = async (req, res) => {
        try {
            const { id } = req.params;
            const { title, description, image, document, is_published, categoryId } = req.body;
            const route = await Routes.findByPk(id);
            if (!route) return res.status(404).json({ error: 'Route not found' });
            await route.update({ title, description, image, document, is_published, categoryId });
            res.json(route);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const deleteRoute = async (req, res) => {
        try {
            const { id } = req.params;
            const route = await Routes.findByPk(id);
            if (!route) return res.status(404).json({ error: 'Route not found' });
            await route.destroy();
            res.status(204).send();
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const markPointAsVisited = async (req, res) => {
    try {
        const { routeId, attractionId } = req.body;
        const routeItem = await Routes_Items.findOne({ where: { route_id: routeId, attraction_id: attractionId } });
        if (!routeItem) return res.status(404).json({ error: 'Точка не найдена в маршруте' });
        await routeItem.update({ isVisited: true });
        res.json(routeItem);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

const addToFavorites = async (req, res) => {
    try {
        const { userId, routeId } = req.body;
        const favorite = await User_Route.findOne({ where: { user_id: userId, route_id: routeId } });
        if (!favorite) {
            await User_Route.create({ user_id: userId, route_id: routeId, isFavorite: true });
            return res.status(201).json({ message: 'Route added to favorites' });
        }
        res.status(400).json({ error: 'Route is already in favorites' });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

const finishRoute = async (req, res) => {
    try {
        const { userId, routeId } = req.body;
        const userRoute = await User_Route.findOne({ where: { user_id: userId, route_id: routeId } });
        if (!userRoute) return res.status(404).json({ error: 'Route not found for user' });

        await userRoute.update({ isCompleted: true });
        res.json({ message: 'Route marked as completed', userRoute });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

const createCategory = async (req, res) => {
        try {
            const { title } = req.body;
            const category = await Categories_Routes.create({ title });
            res.status(201).json(category);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const getAllCategories = async (req, res) => {
        try {
            const categories = await Categories_Routes.findAll();
            res.json(categories);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const deleteCategory = async (req, res) => {
        try {
            const { id } = req.params;
            const category = await Categories_Routes.findByPk(id);
            if (!category) return res.status(404).json({ error: 'Category not found' });
            await category.destroy();
            res.status(204).send();
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

module.exports = {createRoute, updateRoute, getRouteById, deleteRoute, markPointAsVisited, addToFavorites, finishRoute, createCategory, getAllCategories, deleteCategory};