const express = require('express');
const router = express.Router();
const { 
    createAttraction, getAttractionById, updateAttraction, deleteAttraction, 
    createCategory, getAllCategories, deleteCategory, getAllAttractions 
} = require('../controllers/attractionController');
const authMiddleware = require('../middleware/authMiddleware');

// Сначала категории (иначе '/:id' перехватит 'categories')
router.post('/categories', createCategory);
router.get('/categories', getAllCategories);
router.delete('/categories/:id', authMiddleware, deleteCategory);

// Потом аттракционы
router.post('/attraction', createAttraction);
router.get('/attraction', getAllAttractions);
router.get('/:id', getAttractionById);
router.put('/:id', authMiddleware, updateAttraction);
router.delete('/:id', authMiddleware, deleteAttraction);

module.exports = router;
