const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { User, Routes, User_Route } = require('../models/models');

const generateJwt = (id, email, role) => {
    return jwt.sign({ id, email, role }, process.env.SECRET_KEY, { expiresIn: '24h' });
};

const register = async (req, res) => {
    const { email, password, name, surname, role } = req.body;
    if (!email || !password) {
        return res.status(400).json({ message: 'Некорректные данные' });
    }
    
    const candidate = await User.findOne({ where: { email } });
    if (candidate) {
        return res.status(400).json({ message: 'Пользователь уже существует' });
    }

    const hashPassword = await bcrypt.hash(password, 5);
    const user = await User.create({ email, password: hashPassword, name, surname, role });
    const token = generateJwt(user.id, user.email, user.role);

    return res.json({ token });
};

const login = async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findOne({ where: { email } });
    if (!user) {
        return res.status(404).json({ message: 'Пользователь не найден' });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
        return res.status(400).json({ message: 'Неверный пароль' });
    }

    const token = generateJwt(user.id, user.email, user.role);
    return res.json({ token });
};

const getUserRoutes = async (req, res) => {
    const { userId } = req.body;
    try {
      const routes = await User_Route.findAll({ 
        where: { userId },
        include: [
          {
            model: Routes,
            as: 'users' // Используем правильный псевдоним
          }
        ]
      });
      return res.json(routes);
    } catch (error) {
      console.error('Ошибка на сервере:', error); // Логируем ошибку
      return res.status(500).json({ message: 'Ошибка на сервере' });
    }
};

const updateUser = async (req, res) => {
    try {
        const { id } = req.params;
        const { name, surname, email, birthdate, role } = req.body;
        const { photo } = req.files; 
        let fileName = uuid.v4() + ".jpg";
        photo.mv(path.resolve(__dirname, '../../diplom_client/public', 'static', fileName));
        const user = await User.findByPk(id);
        if (!user) return res.status(404).json({ error: 'User not found' });
        await user.update({ name, surname, email, birthdate, photo: fileName, role });
        res.json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

const deleteUser = async (req, res) => {
    try {
        const { id } = req.params;
        const user = await User.findByPk(id);
        if (!user) return res.status(404).json({ error: 'User not found' });
        await user.destroy();
        res.status(204).send();
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}
const getUserInfo = async (req, res) => {
    try {
        const { id } = req.params;
        const user = await User.findByPk(id, {
            attributes: ['id', 'name', 'surname', 'email', 'birthdate', 'photo', 'role']
        });

        if (!user) {
            return res.status(404).json({ error: 'Пользователь не найден' });
        }

        res.json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};


module.exports = {register, login, getUserRoutes, updateUser, deleteUser, getUserInfo};
