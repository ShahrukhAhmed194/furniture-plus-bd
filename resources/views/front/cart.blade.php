@extends('front.layouts.master')

@section('head')
@include('meta::manager', [
    'title' => 'Cart - ' . ($settings_g['title'] ?? ''),
])
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="bg-gray-100">
    <div class="pt-4">
        <div class="{{ $container }} mt-5 pb-4 md:pb-16">
            @include('front.layouts.breadcrumb', [
                'title' => 'Cart',
                'url' => '#'
            ])

            @if(count($carts['carts']))
                @if($template == 2)
                    @include('front.template2.cart')
                @elseif($template == 3)
                    @include('front.template3.cart')
                @else @include('front.template1.cart')
                @endif
            @else
                <div class="bg-white border rounded p-4">
                    <div class="text-center text-lg py-20">
                        <p>No Item in in cart. <a href="{{route('homepage')}}" class="text-primary">Continue Shopping</a></p>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection

@section('footer')
    <script>
        let inside_dhaka_delivery_charge = {{env('INSIDE_DHAKA_DELIVERY_CHARGE')}};
        let outside_dhaka_delivery_charge = {{env('OUTSIDE_DHAKA_DELIVERY_CHARGE')}};

        $(document).on('click', '.updateCart', function(){
            let shipping_charge = $('.shipping_charge').val();
            let type = $(this).data('type');
            let calculated_quantity = 0;
            let cart_id = $(this).data('id');
            let quantity = $(this).closest('.cart_qty_wrap').find('.updateCartQty').val();

            if(type == 'plus'){
                calculated_quantity = Number(quantity) + 1;
            }else{
                calculated_quantity = Number(quantity) - 1;
            }

            if(calculated_quantity > 0){
                $(this).closest('.cart_qty_wrap').find('.updateCartQty').val(calculated_quantity);
                $.ajax({
                    url: '{{route("cart.update")}}',
                    method: 'POST',
                    dataType: 'JSON',
                    context: this,
                    data: {cart_id, quantity: calculated_quantity, _token: '{{csrf_token()}}'},
                    success: function(result){
                        $('.top_cart_count').html(result.summary.count);
                        $('.product_total').html(result.summary.product_total);

                        $(this).closest('li').find('.single_cart_amount').html(result.single_amount);
                        $('.grand_total').html(Number(result.summary.product_total) + Number(shipping_charge));
                    },
                    error: function(){
                        cAlert('error', 'Update cart error!');
                    }
                });
            }
        });

        $(document).on('submit', '.checkoutForm', function(){
            let phone_number = $('.mobile_number').val();

            if(phone_number.length != 11){
                cAlert('error', 'মোবাইল নম্বর অবসসই ১১ সংখ্যার  হতে হবে');

                return false;
            }else{
                return true;
            }
        });

        $(document).on('change', '.change_area', function(){
            let area = $(this).val();
            let product_total = $('.product_total').html();

            if(area == 'Outside Dhaka'){
                $('.shipping_charge').val(Number(outside_dhaka_delivery_charge));
                $('.shipping_charge_text').html(Number(outside_dhaka_delivery_charge));
                $('.grand_total').html(Number(product_total) + Number(outside_dhaka_delivery_charge));
                $('#payment_method_area').addClass('hidden')
            }else{
                $('.shipping_charge').val(Number(inside_dhaka_delivery_charge));
                $('.shipping_charge_text').html(Number(inside_dhaka_delivery_charge));
                $('.grand_total').html(Number(product_total) + Number(inside_dhaka_delivery_charge));
                $('#payment_method_area').removeClass('hidden')
            }
        });

        fbq('track', 'InitiateCheckout');
    </script>

    @if(Info::Settings('fb_api', 'track') == 'Yes')
    <script>
        // FB Conversion Track
        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('fbTrack') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    track_type: 'InitiateCheckout',
                    data: {
                        value: '{{ $carts["product_total"] }}',
                        currency: 'BDT'
                    }
                },
                success: function (response) {
                    if(response == 'true'){
                        console.log('FB Tracked Page Viewed!');
                    }else{
                        console.log('FB Tracked Failed');
                    }
                },
                error: function(){
                    console.log('FB Tracked Error Page View!');
                }
            });
        });
    </script>
    @endif
@endsection
