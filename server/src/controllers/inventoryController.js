const InventoryItem = require('../models/InventoryItem');

// @desc    Get all inventory items for user
// @route   GET /api/inventory
// @access  Private
exports.getItems = async (req, res, next) => {
  try {
    const items = await InventoryItem.find({ owner: req.user.id, status: 'active' }).sort({ expiryDate: 1 });

    res.status(200).json({
      success: true,
      count: items.length,
      data: items,
    });
  } catch (err) {
    next(err);
  }
};

// @desc    Add new inventory item
// @route   POST /api/inventory
// @access  Private
exports.addItem = async (req, res, next) => {
  try {
    req.body.owner = req.user.id;

    const item = await InventoryItem.create(req.body);

    res.status(201).json({
      success: true,
      data: item,
    });
  } catch (err) {
    next(err);
  }
};

// @desc    Update inventory item
// @route   PUT /api/inventory/:id
// @access  Private
exports.updateItem = async (req, res, next) => {
  try {
    let item = await InventoryItem.findById(req.params.id);

    if (!item) {
      return res.status(404).json({ success: false, error: 'Item not found' });
    }

    // Make sure user owns the item
    if (item.owner.toString() !== req.user.id) {
      return res.status(401).json({ success: false, error: 'Not authorized' });
    }

    item = await InventoryItem.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    res.status(200).json({
      success: true,
      data: item,
    });
  } catch (err) {
    next(err);
  }
};

// @desc    Delete inventory item
// @route   DELETE /api/inventory/:id
// @access  Private
exports.deleteItem = async (req, res, next) => {
  try {
    const item = await InventoryItem.findById(req.params.id);

    if (!item) {
      return res.status(404).json({ success: false, error: 'Item not found' });
    }

    if (item.owner.toString() !== req.user.id) {
      return res.status(401).json({ success: false, error: 'Not authorized' });
    }

    await item.deleteOne();

    res.status(200).json({
      success: true,
      data: {},
    });
  } catch (err) {
    next(err);
  }
};
