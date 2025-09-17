# Blaulang Foreign Function Interface (FFI)

Blaulang 提供与 C/C++ 的互操作机制。

## 使用示例
```bll
extern func c_add(int, int) -> int

let result = c_add(2, 3)
```
