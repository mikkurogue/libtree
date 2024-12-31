const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn Quadtree(comptime T: type) type {
    return struct {
        max_points: i32,
        max_levels: i32,
        level: usize,
        node: Node(T),
        _size: usize,

        pub fn init(allocator: *Allocator, size: usize) !Quadtree(T) {
            const buffer = try allocator.create(T, size);

            return .{
                .allocator = allocator,
                .max_points = 0,
                .max_levels = 0,
                .node = buffer,
                ._size = size,
            };
        }
    };
}

pub fn Node(comptime T: type) type {
    return struct {
        children: [4]?*Node(T) = .{ null, null, null, null },

        pub fn init() !Node(T) {}
    };
}
