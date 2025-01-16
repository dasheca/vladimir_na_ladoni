// middleware/authMiddleware.js
const jwt = require('jsonwebtoken');
const ApiError = require('../error/ApiError');

const authMiddleware = (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1];

  if (!token) {
    return next(ApiError.unauthorized('Токен не предоставлен'));
  }

  try {
    const decoded = jwt.verify(token, 'your_secret_key');
    req.user = decoded;
    next();
  } catch (error) {
    return next(ApiError.unauthorized('Неверный токен'));
  }
};

module.exports = authMiddleware;
