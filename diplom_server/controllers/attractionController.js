const {Attractions, Categories_Attraction } = require('../models/models');
const { Op } = require('sequelize');
const uuid = require('uuid');
const path = require('path')

const createAttraction = async (req, res) => {
        try {
            const { title, description, latitude, longitude, site, categoryId } = req.body;
            const { image } = req.files;
            if (!image) {
                return res.status(400).json({ message: 'Фото обязательно для загрузки' });
            }
            let fileName = uuid.v4() + ".jpg";
            image.mv(path.resolve(__dirname, '../../diplom_client/public', 'static', fileName));
            const attraction = await Attractions.create({ title, description, image: fileName, latitude, longitude, site, categoryId });
            res.status(201).json(attraction);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const getAllAttractions = async (req, res) => {
    try {
        // Получение всех достопримечательностей
        const attractions = await Attractions.findAll();
        
        // Если достопримечательности не найдены
        if (!attractions || attractions.length === 0) {
            return res.status(404).json({ message: 'No attractions found' });
        }

        // Возвращаем список достопримечательностей
        res.json(attractions);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

const getAttractionById = async (req, res) => {
        try {
            const { id } = req.params;
            const attraction = await Attractions.findByPk(id);
            if (!attraction) return res.status(404).json({ error: 'Attraction not found' });
            res.json(attraction);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const updateAttraction = async (req, res) => {
        try {
            const { id } = req.params;
            const { title, description, image, latitude, longitude, site, categoryId } = req.body;
            const attraction = await Attractions.findByPk(id);
            if (!attraction) return res.status(404).json({ error: 'Attraction not found' });
            await attraction.update({ title, description, image, latitude, longitude, site, categoryId });
            res.json(attraction);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const deleteAttraction = async (req, res) => {
        try {
            const { id } = req.params;
            const attraction = await Attractions.findByPk(id);
            if (!attraction) return res.status(404).json({ error: 'Attraction not found' });
            await attraction.destroy();
            res.status(204).send();
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const createCategory = async (req, res) => {
        try {
            const { title } = req.body;
            const category = await Categories_Attraction.create({ title });
            res.status(201).json(category);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const getAllCategories = async (req, res) => {
    try {
        const categories = await Categories_Attraction.findAll();
        res.json(categories);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};


const deleteCategory = async (req, res) => {
        try {
            const { id } = req.params;
            const category = await Categories_Attraction.findByPk(id);
            if (!category) return res.status(404).json({ error: 'Category not found' });
            await category.destroy();
            res.status(204).send();
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

module.exports = {createAttraction, getAttractionById, updateAttraction, deleteAttraction, createCategory, getAllCategories, deleteCategory, getAllAttractions};