import express from 'express'
import UserController from '../controllers/User.js'
import authMiddleware from '../middleware/authMiddleware.js'
import adminMiddleware from '../middleware/adminMiddleware.js'

const router = new express.Router()

router.post('/signup', UserController.signup)
router.post('/login', UserController.login)
router.get('/check', authMiddleware, UserController.check)

router.get('/getall', authMiddleware, adminMiddleware, UserController.getAll)
router.get('/getone/:id([0-9]+)', authMiddleware, adminMiddleware, UserController.getOne)
router.post('/create', authMiddleware, adminMiddleware, UserController.create)
router.put('/update/:id([0-9]+)', authMiddleware, adminMiddleware, UserController.update)
router.delete('/delete/:id([0-9]+)', authMiddleware, adminMiddleware, UserController.delete)

export default router