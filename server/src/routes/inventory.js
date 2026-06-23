const express = require('express');
const {
  getItems,
  addItem,
  updateItem,
  deleteItem,
} = require('../controllers/inventoryController');

const { protect } = require('../middleware/auth');

const router = express.Router();

router.use(protect); // All inventory routes are protected

router.route('/').get(getItems).post(addItem);
router.route('/:id').put(updateItem).delete(deleteItem);

module.exports = router;
