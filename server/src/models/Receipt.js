const mongoose = require('mongoose');

const receiptSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.ObjectId,
    ref: 'User',
    required: true,
  },
  storeName: {
    type: String,
    trim: true,
  },
  totalAmount: {
    type: Number,
    default: 0,
  },
  items: [
    {
      name: String,
      price: Number,
    },
  ],
  scanDate: {
    type: Date,
    default: Date.now,
  },
  rawText: {
    type: String,
  },
  imageUrl: {
    type: String,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('Receipt', receiptSchema);
