<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
     // แสดงรีวิวของสินค้าที่ระบุ
 public function index($productId)
{
    $reviews = Review::with('user')
        ->where('product_id', $productId)
        ->orderByDesc('created_at')
        ->get();

    return response()->json($reviews);
}
   
    public function store(Request $request, $productId)
    {
        //  ตรวจสอบว่า login แล้วหรือยัง
        $user = Auth::user();
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'คุณต้องเข้าสู่ระบบก่อนทำรายการนี้',
            ], 401);
        }

        //  Validate ข้อมูล
        $validatedData = $request->validate([
            'rating' => 'required|integer|min:1|max:5',
            'content' => 'required|string|max:1000',
        ]);

        // บันทึกรีวิว
        $review = new Review([
            'product_id' => $productId,
            'user_id' => $user->id,
            'rating' => $validatedData['rating'],
            'content' => $validatedData['content'],
        ]);

        if ($review->save()) {
            return response()->json([
                'success' => true,
                'message' => 'รีวิวถูกบันทึกเรียบร้อยแล้ว',
                'data' => $review,
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'ไม่สามารถบันทึกรีวิวได้',
        ], 500);
    }

    // ลบรีวิว
    public function destroy($id)
    {
        $review = Review::find($id);

        if (!$review) {
            return response()->json([
                'success' => false,
                'message' => 'ไม่พบรีวิว',
            ], 404);
        }

        if ($review->delete()) {
            return response()->json([
                'success' => true,
                'message' => 'ลบรีวิวเรียบร้อยแล้ว',
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'ไม่สามารถลบรีวิวได้',
        ], 500);
    }

    public function userReviews()
    {
        $user = Auth::user();
        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'กรุณาเข้าสู่ระบบ',
            ], 401);
        }

        $reviews = Review::where('user_id', $user->id)->get();

        return response()->json([
            'success' => true,
            'data' => $reviews,
        ]);
    }
}
