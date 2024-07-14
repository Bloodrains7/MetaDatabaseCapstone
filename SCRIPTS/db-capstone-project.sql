CREATE SCHEMA `littlelemondb` ;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cuisine` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Cuisine` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`ItemCategory` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Status` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`PhoneNumber` (
  `id` INT NOT NULL,
  `number` INT NOT NULL,
  `dialCode` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Role` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `id` INT NOT NULL,
  `deliveryDate` DATE NOT NULL,
  `statusId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_OrderDeliveryStatus_Status1_idx` (`statusId` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDeliveryStatus_Status1`
    FOREIGN KEY (`statusId`)
    REFERENCES `LittleLemonDB`.`Status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `id` INT NOT NULL,
  `staffName` VARCHAR(100) NOT NULL,
  `salary` DECIMAL(10,2) NOT NULL,
  `roleId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Staff_Role1_idx` (`roleId` ASC) VISIBLE,
  CONSTRAINT `fk_Staff_Role1`
    FOREIGN KEY (`roleId`)
    REFERENCES `LittleLemonDB`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Item` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `ItemCategory_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_ItemCategory1_idx` (`ItemCategory_id` ASC) VISIBLE,
  CONSTRAINT `fk_Item_ItemCategory1`
    FOREIGN KEY (`ItemCategory_id`)
    REFERENCES `LittleLemonDB`.`ItemCategory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order` (
  `id` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `totalCost` DECIMAL(10,2) NOT NULL,
  `orderDeliveryStatusId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Orders_OrderDeliveryStatus1`
    FOREIGN KEY (`orderDeliveryStatusId`)
    REFERENCES `LittleLemonDB`.`OrderDeliveryStatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `id` INT NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phoneNumberId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Customer_PhoneNumber1`
    FOREIGN KEY (`phoneNumberId`)
    REFERENCES `LittleLemonDB`.`PhoneNumber` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Booking` (
  `id` INT NOT NULL,
  `bookingDate` DATE NOT NULL,
  `takeNumber` INT NOT NULL,
  `orderId` INT NOT NULL,
  `customerId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Bookings_Orders`
    FOREIGN KEY (`orderId`)
    REFERENCES `LittleLemonDB`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
CONSTRAINT `fk_Bookings_Customer`
    FOREIGN KEY (`customerId`)
    REFERENCES `LittleLemonDB`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffHasBookings` (
  `id` INT NOT NULL,
  `bookingsId` INT NOT NULL,
  `staffId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_StaffInformation_has_Bookings_Bookings1`
    FOREIGN KEY (`bookingsId`)
    REFERENCES `LittleLemonDB`.`Booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StaffHasBookings_Staff1`
    FOREIGN KEY (`staffId`)
    REFERENCES `LittleLemonDB`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `id` INT NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `note` VARCHAR(128) NULL,
  `orderId` INT NOT NULL,
  `cuisineId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Menu_Order1`
    FOREIGN KEY (`orderId`)
    REFERENCES `LittleLemonDB`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_Cuisine1`
    FOREIGN KEY (`cuisineId`)
    REFERENCES `LittleLemonDB`.`Cuisine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItem` (
  `id` INT NOT NULL,
  `menuId` INT NOT NULL,
  `itemId` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Menu_has_Item_Menu1`
    FOREIGN KEY (`id` , `menuId`)
    REFERENCES `LittleLemonDB`.`Menu` (`id` , `orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menu_has_Item_Item1`
    FOREIGN KEY (`itemId`)
    REFERENCES `LittleLemonDB`.`Item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;