-- Sample data for SmartDine backend
-- This script creates sample items and order_items for testing top dishes API

-- Thêm dữ liệu items mẫu
INSERT INTO items (name, price, category_id, description, image_url, status_id, created_at, updated_at) VALUES
('Phở Bò', 45000, 1, 'Phở bò truyền thống', NULL, 1, NOW(), NOW()),
('Cơm Rang Dưa Bò', 35000, 2, 'Cơm rang với dưa bò', NULL, 1, NOW(), NOW()),
('Bún Bò Huế', 40000, 1, 'Bún bò Huế cay', NULL, 1, NOW(), NOW()),
('Gỏi Cuốn', 25000, 3, 'Gỏi cuốn tôm thịt', NULL, 1, NOW(), NOW()),
('Cà Phê Sữa Đá', 20000, 4, 'Cà phê sữa đá', NULL, 1, NOW(), NOW()),
('Trà Đá', 15000, 4, 'Trà đá pha sẵn', NULL, 1, NOW(), NOW()),
('Bánh Mì Thịt', 30000, 5, 'Bánh mì thịt nướng', NULL, 1, NOW(), NOW()),
('Canh Chua Cá', 35000, 1, 'Canh chua cá hồi', NULL, 1, NOW(), NOW()),
('Gà Rán', 55000, 2, 'Gà rán giòn', NULL, 1, NOW(), NOW()),
('Mì Xào Hải Sản', 42000, 1, 'Mì xào hải sản', NULL, 1, NOW(), NOW());

-- Thêm order_items cho các orders đã có (để test top dishes)
-- Giả sử orders đã tồn tại với ID từ 1 trở lên

-- Order 1: Phở Bò x2, Cơm Rang x1, Trà Đá x3
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(1, 1, 2, 1, 1, NOW()), (1, 2, 1, 1, 1, NOW()), (1, 6, 3, 1, 1, NOW());

-- Order 2: Bún Bò Huế x1, Gỏi Cuốn x2, Cà Phê x2
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(2, 3, 1, 1, 1, NOW()), (2, 4, 2, 1, 1, NOW()), (2, 5, 2, 1, 1, NOW());

-- Order 3: Phở Bò x3, Gà Rán x1, Trà Đá x4
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(3, 1, 3, 1, 1, NOW()), (3, 9, 1, 1, 1, NOW()), (3, 6, 4, 1, 1, NOW());

-- Order 4: Cơm Rang x1, Bánh Mì x1, Cà Phê x1
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(4, 2, 1, 1, 1, NOW()), (4, 7, 1, 1, 1, NOW()), (4, 5, 1, 1, 1, NOW());

-- Order 5: Phở Bò x4, Bún Bò Huế x2, Gỏi Cuốn x3, Trà Đá x5
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(5, 1, 4, 1, 1, NOW()), (5, 3, 2, 1, 1, NOW()), (5, 4, 3, 1, 1, NOW()), (5, 6, 5, 1, 1, NOW());

-- Thêm một số order_items khác để có dữ liệu phong phú hơn
INSERT INTO order_items (order_id, item_id, quantity, status_id, added_by, created_at) VALUES
(6, 9, 2, 1, 1, NOW()), (6, 8, 1, 1, 1, NOW()), (6, 5, 3, 1, 1, NOW()),
(7, 10, 2, 1, 1, NOW()), (7, 4, 1, 1, 1, NOW()), (7, 6, 2, 1, 1, NOW()),
(8, 1, 2, 1, 1, NOW()), (8, 2, 2, 1, 1, NOW()), (8, 7, 1, 1, 1, NOW()),
(9, 3, 1, 1, 1, NOW()), (9, 9, 1, 1, 1, NOW()), (9, 5, 2, 1, 1, NOW()),
(10, 1, 3, 1, 1, NOW()), (10, 10, 1, 1, 1, NOW()), (10, 6, 3, 1, 1, NOW());