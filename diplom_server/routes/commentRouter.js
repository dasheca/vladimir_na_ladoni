const express = require('express');
const router = express.Router();
const {
    addRouteComment,
    getCommentsByRoute,
    deleteComment,
    addSiteComment,
    getSiteComments,
    validateSiteComment
} = require('../controllers/commentController');

// Добавить комментарий к маршруту
router.post('/routes/comments', addRouteComment);

// Получить все комментарии к маршруту по ID
router.get('/routes/:routeId/comments', getCommentsByRoute);

// Удалить комментарий по ID
router.delete('/comments/:id', deleteComment);

// Добавить комментарий к сайту
router.post('/site', addSiteComment);

// Получить все подтвержденные комментарии к сайту
router.get('/site', getSiteComments);

// Подтвердить комментарий к сайту
router.put('/site', validateSiteComment);

module.exports = router;
