const Router = require('express')
const router = new Router()
const userRouter = require('./userRouter')
const commentRouter = require('./commentRouter')
const attractionRouter = require('./attractionRouter')
const routeRouter = require('./routeRouter')

router.use('/user', userRouter)
router.use('/comment', commentRouter)
router.use('/attraction', attractionRouter)
router.use('/route', routeRouter)



module.exports = router