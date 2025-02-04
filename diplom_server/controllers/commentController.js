const { User, Сomment_Route, Сomment_Site } = require('../models/models');
const { Op } = require('sequelize');

const addRouteComment = async (req, res) => {
        try {
            const { userId, routeId, comment } = req.body;
            const routeComment = await Сomment_Route.create({ userId, routeId, comment });
            res.status(201).json(routeComment);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const getCommentsByRoute = async (req, res) => {
        try {
            const { routeId } = req.params;
            const comments = await Сomment_Route.findAll({ where: { routeId }, include: [{ model: User, as: 'user', attributes: ['name', 'surname'] }] });
            res.json(comments);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const deleteComment = async (req, res) => {
        try {
            const { id } = req.params;
            const comment = await Сomment_Route.findByPk(id);
            if (!comment) return res.status(404).json({ error: 'Comment not found' });
            await comment.destroy();
            res.status(204).send();
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const addSiteComment = async (req, res) => {
        try {
            const { name, surname, comment } = req.body;
            const siteComment = await Сomment_Site.create({ name, surname, comment });
            res.status(201).json(siteComment);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const getSiteComments = async (req, res) => {
        try {
            const comments = await Сomment_Site.findAll({ where: { is_validated: true } });
            res.json(comments);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

const validateSiteComment = async (req, res) => {
        try {
            const { id } = req.params;
            const comment = await Сomment_Site.findByPk(id);
            if (!comment) return res.status(404).json({ error: 'Comment not found' });
            await comment.update({ is_validated: true });
            res.json(comment);
        } catch (error) {
            res.status(400).json({ error: error.message });
        }
}

module.exports = {addRouteComment, getCommentsByRoute, deleteComment, addSiteComment, getSiteComments, validateSiteComment};