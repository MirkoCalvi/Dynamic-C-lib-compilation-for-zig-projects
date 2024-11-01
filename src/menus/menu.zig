const std = @import("std");
const x_menu = @import("x_menu");
// Import the C header file
const c_lib = @cImport(@cInclude("menu_lib.h"));

pub const Menu_list = enum {
    Normal,
    Fruitarian,
    Vegan,
    Megan,
};

pub fn fromString(value: []const u8) Menu_list {
    if (std.mem.eql(u8, value, "fruitarian")) {
        return Menu_list.Fruitarian;
    } else if (std.mem.eql(u8, value, "vegan")) {
        return Menu_list.Vegan;
    } else if (std.mem.eql(u8, value, "megan")) {
        return Menu_list.Megan;
    } else {
        return Menu_list.Normal;
    }
}

//x_menu is a Dynamic zig library
pub fn printMenu() void {
    x_menu.printMenu();
}

//c_lib is a Dynamic C library
pub fn digestMenu() void {
    _ = c_lib.digest();
}

//c_lib is a Dynamic C library
pub fn priceMenu(numb: i32) i32 {
    return c_lib.price(numb);
}
