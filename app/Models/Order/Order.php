<?php

namespace App\Models\Order;

use App\Models\OrderPayment;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable=[
        'status', 'admin_read', 'payment_status', 'user_id', 'first_name', 'last_name', 'street', 'apartment',
        'city', 'state', 'zip', 'country', 'mobile_number', 'email', 'shipping_full_name', 'shipping_email',
        'shipping_mobile_number', 'shipping_street', 'shipping_apartment', 'shipping_post_code', 'shipping_city',
        'shipping_state', 'shipping_country', 'shipping_charge', 'hidden_shipping_charge', 'shipping_method',
        'shipping_weight', 'shipping_length', 'shipping_invoice', 'shipping_id', 'shipping_order_id', 'product_total',
        'tax', 'tax_amount', 'other_cost', 'discount', 'discount_amount', 'courier', 'courier_invoice', 'courier_status',
        'courier_payment_status', 'courier_payment_at', 'courier_submitted_at', 'payment_method', 'payment_transaction_id',
        'refund_shipping_amount', 'refund_other_charge', 'refund_product_total', 'refund_tax_amount', 'refund_total_amount',
        'coupon_id', 'coupon_code', 'note', 'staff_note', 'reference_no', 'attachment', 'admin_id',
    ];
    // Attachment Path
    public function getAttachmentPathAttribute(){
        if($this->attachment && file_exists(public_path('uploads/order', $this->attachment))){
            return asset('uploads/order/' . $this->attachment);
        }

        return null;
    }

    public function getFullNameAttribute()
    {
        return "{$this->first_name} {$this->last_name}";
    }

    public function getFullAddressAttribute()
    {
        return "{$this->street}";
    }

    public function getShippingFullAddressAttribute()
    {
        return "{$this->shipping_street}";
    }

    public function getCustomProductTotalAttribute(){
        return $this->product_total - $this->refund_product_total;
    }

    public function getGrandTotalAttribute()
    {
        return ($this->shipping_charge + $this->product_total + $this->tax_amount + $this->other_cost) - ($this->discount_amount + $this->refund_total_amount);
    }

    // Order Products
    public function OrderProducts(){
        return $this->hasMany(OrderProduct::class);
    }

    public function OrderPayments(){
        return $this->hasMany(OrderPayment::class);
    }

    public function getShippingWeightKgAttribute(){
        if($this->shipping_weight && $this->shipping_weight > 0){
            return $this->shipping_weight / 100;
        }
        return 0;
    }
}
