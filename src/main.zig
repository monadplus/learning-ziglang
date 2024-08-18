const std = @import("std");

pub fn main() !void {
    const foo = [3]*const [5]u8{ "~{s}~", "<{s}>", "d{s}b" };
    comptime var i = 0;

    inline while (i < foo.len) : (i += 1) {
        std.debug.print(foo[i] ++ "\n", .{foo[i]});
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
