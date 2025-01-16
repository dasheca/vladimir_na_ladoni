const express = require('express');
const router = express.Router();
const { register, login, getUserRoutes, updateUser, deleteUser, getUserInfo } = require('../controllers/userController');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/register', register);
router.post('/login', login);
router.get('/:id', getUserInfo);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);
router.get('/:id/routes', getUserRoutes);


module.exports = router;