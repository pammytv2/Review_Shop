<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    // แสดงสินค้าทั้งหมด
    public function index()
    {
        return Product::withCount('reviews')->get();
    }

    // สร้างสินค้าใหม่
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'price' => 'required|numeric|min:0',
            'url_img' => 'nullable|url',  // URL ของรูปภาพ
        ]);

        $product = Product::create($validated);

        return response()->json([
            'message' => 'Product created successfully',
            'product' => $product
        ], 201);
    }

    // แสดงสินค้ารายการเดียว (พร้อมรีวิว)
    public function show($id)
    {
        $product = Product::with(['reviews.user'])->findOrFail($id);
        return response()->json($product);
    }

    // อัปเดตสินค้า
    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $validated = $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|required|string',
            'price' => 'sometimes|required|numeric|min:0',
            'url_img' => 'nullable|url',
        ]);

        $product->update($validated);

        return response()->json([
            'message' => 'Product updated',
            'product' => $product
        ]);
    }

    // ลบสินค้า
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();

        return response()->json(['message' => 'Product deleted']);
    }
}
