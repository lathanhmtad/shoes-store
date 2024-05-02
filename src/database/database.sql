use master
go

drop database if exists shoes_store
go

create database shoes_store
go

use shoes_store
go

CREATE TABLE category (
    id INT PRIMARY KEY,
    name NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE product (
	id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    brand NVARCHAR(255),
    image NVARCHAR(255),
    price INT,
    description NVARCHAR(MAX),
    stock BIT,
	is_new BIT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);
GO

INSERT INTO category (id, name)
VALUES
    (1, N'Giày thể thao'),
    (2, N'Giày công sở'),
    (3, N'Giày dép nam'),
    (4, N'Giày dép nữ'),
    (5, N'Giày cho trẻ em');
go

INSERT INTO product (name, brand, image, price, description, stock, category_id, is_new)
VALUES
    (N'Giày Nike Air Max', N'Nike', N'nike_air_max.jpg', 1500000, N'Đôi giày thể thao chất lượng cao từ Nike, thiết kế hiện đại, phù hợp cho các hoạt động thể thao và đi dạo hàng ngày.', 1, 1, 1),
    (N'Giày Oxford nam', N'Clarks', N'oxford_nam.jpg', 2000000, N'Đôi giày công sở chất lượng từ Clarks, kiểu dáng sang trọng, phù hợp với mọi trang phục công sở.', 0, 2, 0),
    (N'Giày búp bê nữ', N'Aldo', N'bup_be_nu.jpg', 1200000, N'Đôi giày búp bê nữ đẹp và thoải mái từ Aldo, phù hợp cho mọi dịp từ đi chơi đến đi làm.', 1, 4, 0),
    (N'Giày thể thao trẻ em', N'Adidas', N'the_thao_tre_em.jpg', 800000, N'Giày thể thao cho trẻ em với thiết kế nhẹ nhàng và êm ái từ Adidas, giúp trẻ tự tin khi vận động.', 1, 5, 0),
    (N'Giày lười nam', N'Giày Sài Gòn', N'gio_luoi_nam.jpg', 900000, N'Đôi giày lười nam tiện lợi và thoải mái, phù hợp cho mọi hoạt động hàng ngày.', 1, 3, 1),
    (N'Giày cao gót nữ', N'Jimmy Choo', N'cao_got_nu.jpg', 3000000, N'Đôi giày cao gót nữ từ thương hiệu nổi tiếng Jimmy Choo, tôn dáng và sang trọng cho phụ nữ.', 1, 4, 0),
    (N'Giày thể thao nam', N'Puma', N'the_thao_nam.jpg', 1300000, N'Giày thể thao nam chất lượng từ Puma, phù hợp cho mọi hoạt động vận động ngoài trời.', 1, 3, 0),
    (N'Giày sandal nữ', N'Gucci', N'sandal_nu.jpg', 2500000, N'Đôi giày sandal nữ đẹp và thoải mái từ Gucci, phù hợp cho mùa hè và du lịch.', 0, 4, 0),
    (N'Giày công sở nữ', N'Aldo', N'cong_so_nu.jpg', 1800000, N'Đôi giày công sở nữ kiểu dáng thanh lịch từ Aldo, phù hợp cho mọi dịp đi làm.', 1, 2, 0),
    (N'Giày thể thao nam', N'New Balance', N'the_thao_nam2.jpg', 1400000, N'Đôi giày thể thao nam từ New Balance, chất liệu đế êm ái và bền bỉ, phù hợp cho mọi hoạt động thể thao.', 1, 3, 1),
    (N'Giày búp bê nữ', N'Zara', N'bup_be_nu2.jpg', 1100000, N'Đôi giày búp bê nữ đẹp và dễ phối đồ từ Zara, phù hợp cho các dịp đi chơi và đi làm.', 0, 4, 0),
    (N'Giày sneaker nam', N'Converse', N'sneaker_nam.jpg', 1000000, N'Đôi giày sneaker nam phong cách và dễ phối đồ từ Converse, phù hợp cho mọi hoạt động hàng ngày.', 1, 3, 1),
    (N'Giày cao gót nữ', N'Louboutin', N'cao_got_nu2.jpg', 3500000, N'Đôi giày cao gót nữ chất lượng từ Louboutin, tôn dáng và sang trọng cho phụ nữ.', 1, 4, 0),
    (N'Giày sandal nam', N'Đông Hồ', N'sandal_nam.jpg', 1200000, N'Đôi giày sandal nam đẹp và thoải mái từ Đông Hồ, phù hợp cho mọi dịp hè và du lịch.', 1, 3, 1),
    (N'Giày thể thao trẻ em', N'Puma', N'the_thao_tre_em2.jpg', 900000, N'Giày thể thao trẻ em với thiết kế nhẹ nhàng và êm ái từ Puma, giúp trẻ tự tin khi vận động.', 1, 5, 0);
go

