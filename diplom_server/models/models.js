const { validate } = require('uuid');
const sequelize = require('../db');
const { DataTypes } = require('sequelize');

const User = sequelize.define('user', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: { type: DataTypes.STRING, allowNull: true },
    surname: { type: DataTypes.STRING, allowNull: true },
    email: { type: DataTypes.STRING, unique: true, allowNull: false, validate: { isEmail: true } },
    password: { type: DataTypes.STRING, allowNull: false },
    birthdate: { type: DataTypes.DATE, allowNull: true },
    photo: { type: DataTypes.STRING, allowNull: true },
    role: { type: DataTypes.STRING, allowNull: false, defaultValue: 'USER' },
});

const Categories_Attraction = sequelize.define('categories_attraction', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false },
});

const Categories_Routes = sequelize.define('categories_route', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false },
});

const Attractions = sequelize.define('attractions', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false, unique: true },
    description: { type: DataTypes.STRING, allowNull: false },
    image: { type: DataTypes.STRING, allowNull: false },
    latitude: { type: DataTypes.FLOAT, allowNull: false },  
    longitude: { type: DataTypes.FLOAT, allowNull: false }, 
    site: { type: DataTypes.STRING, allowNull: true, defaultValue: '-' },
    categoryId: { type: DataTypes.INTEGER, allowNull: true, references: { model: Categories_Attraction, key: 'id'}, onDelete: 'SET NULL'},
});

const Routes = sequelize.define('routes', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.STRING, allowNull: false },
    image: { type: DataTypes.STRING, allowNull: false },
    document: { type: DataTypes.STRING, allowNull: true },
    userId: { type: DataTypes.INTEGER, allowNull: false },
    is_published: { type: DataTypes.BOOLEAN, allowNull: false, defaultValue: false },
    categoryId: { type: DataTypes.INTEGER, allowNull: true, references: { model: Categories_Routes, key: 'id'}, onDelete: 'SET NULL'},
});

const Routes_Items = sequelize.define('routes_items', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    routeId: { type: DataTypes.INTEGER, allowNull: false, references: { model: Routes, key: 'id'}, onDelete: 'CASCADE'},
    attractionId: { type: DataTypes.INTEGER, allowNull: false, references: { model: Attractions, key: 'id'}, onDelete: 'CASCADE'},
    position: { type: DataTypes.INTEGER, allowNull: false, defaultValue: 1 },
    isVisited: { type: DataTypes.BOOLEAN, allowNull: false, defaultValue: false },
});

const Сomment_Route = sequelize.define('comment_route', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    userId: { type: DataTypes.INTEGER, allowNull: false },
    routeId: { type: DataTypes.INTEGER, allowNull: false, references: { model: Routes, key: 'id'}, onDelete: 'CASCADE'},
    comment: { type: DataTypes.STRING, allowNull: true },
    createdAt: { type: DataTypes.DATE, allowNull: false, defaultValue: DataTypes.NOW },
});

const User_Route = sequelize.define('user_route', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    userId: { type: DataTypes.INTEGER, allowNull: false },
    routeId: { type: DataTypes.INTEGER, allowNull: false, references: { model: Routes, key: 'id'}, onDelete: 'CASCADE'},
    isCompleted: { type: DataTypes.BOOLEAN, allowNull: false, defaultValue: false },
    isFavorite: { type: DataTypes.BOOLEAN, allowNull: false, defaultValue: false },
});

const Сomment_Site = sequelize.define('comment_site', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    name: {type: DataTypes.STRING, allowNull: false},
    surname: {type: DataTypes.STRING, allowNull: false},
    comment: {type: DataTypes.STRING, allowNull: false},
    is_validated: {type: DataTypes.BOOLEAN, allowNull: false, defaultValue: false}
});


User.belongsToMany(Routes, { through: User_Route, foreignKey: 'userId', otherKey: 'routeId', as: 'routes'});
Routes.belongsToMany(User, { through: User_Route, foreignKey: 'routeId', otherKey: 'userId', as: 'users'});

User.hasMany(Routes, { foreignKey: 'userId', as: 'createdRoutes' });
Routes.belongsTo(User, { foreignKey: 'userId', as: 'author' })
  
User.hasMany(Сomment_Route, { foreignKey: 'userId', as: 'routeComments' });
Сomment_Route.belongsTo(User, { foreignKey: 'userId', as: 'user' });
  
Routes.hasMany(Сomment_Route, { foreignKey: 'routeId', as: 'comments' });
Сomment_Route.belongsTo(Routes, { foreignKey: 'routeId', as: 'route' });
  
Categories_Routes.hasMany(Routes, { foreignKey: 'categoryId', as: 'routes' });
Routes.belongsTo(Categories_Routes, { foreignKey: 'categoryId', as: 'category' });
  
Routes.belongsToMany(Attractions, { through: Routes_Items, foreignKey: 'routeId', otherKey: 'attractionId', as: 'attractions'});
Attractions.belongsToMany(Routes, { through: Routes_Items, foreignKey: 'attractionId', otherKey: 'routeId', as: 'routes'});
  
Categories_Attraction.hasMany(Attractions, { foreignKey: 'categoryId', as: 'attractions' });
Attractions.belongsTo(Categories_Attraction, { foreignKey: 'categoryId', as: 'category' });

module.exports = {
    User,
    Attractions,
    Routes,
    Routes_Items,
    Сomment_Route,
    User_Route,
    Categories_Attraction,
    Categories_Routes,
    Сomment_Site
};