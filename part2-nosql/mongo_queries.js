// OP1: insertMany() — insert all 3 documents
db.products.insertMany(require('./sample_documents.json'))

// OP2: find Electronics price > 20000
db.products.find({ category: "Electronics", price: { $gt: 20000 } })

// OP3: find Groceries expiring before 2025-01-01
db.products.find({
category: "Groceries",
"specs.expiry_date": { $lt: "2025-01-01" }
})

// OP4: updateOne() — add discount_percent
db.products.updateOne(
{ product_id: "E101" },
{ $set: { discount_percent: 10 } }
)

// OP5: createIndex()
db.products.createIndex({ category: 1 })

