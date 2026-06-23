const mongoose = require('mongoose');

const inventoryItemSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Please add an item name'],
    trim: true,
  },
  category: {
    type: String,
    required: [true, 'Please add a category'],
    enum: [
      'Dairy',
      'Vegetables',
      'Fruits',
      'Meat & Poultry',
      'Seafood',
      'Bakery',
      'Pantry',
      'Beverages',
      'Frozen',
      'Others',
    ],
    default: 'Others',
  },
  quantity: {
    type: Number,
    required: [true, 'Please add a quantity'],
    default: 1,
  },
  unit: {
    type: String,
    default: 'pcs',
  },
  expiryDate: {
    type: Date,
    required: [true, 'Please add an expiry date'],
  },
  purchaseDate: {
    type: Date,
    default: Date.now,
  },
  owner: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
    required: true,
  },
  location: {
    type: String,
    enum: ['Fridge', 'Pantry', 'Freezer'],
    default: 'Fridge',
  },
  status: {
    type: String,
    enum: ['active', 'consumed', 'wasted'],
    default: 'active',
  },
  price: {
    type: Number,
    default: 0,
  },
  imageUrl: {
    type: String,
    default: '',
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

// Index for faster queries on owner and expiry
inventoryItemSchema.index({ owner: 1, expiryDate: 1 });

module.exports = mongoose.model('InventoryItem', inventoryItemSchema);
