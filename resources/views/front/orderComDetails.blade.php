@extends('front.layouts.master')

@section('head')
@include('meta::manager', [
    'title' => 'Order Success - ' . ($settings_g['title'] ?? ''),
])
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="{{ $container }} mt-6 pb-16">
    @include('front.layouts.breadcrumb', [
        'title' => 'Order Success',
        'url' => '#'
    ])
    @if($template ==3)
        <div class="p-3 py-5">
            <div class="max-w-[1500px] mx-auto">
                <div class="flex flex-col items-center justify-center">
                    <img src="https://cdn.dribbble.com/users/147386/screenshots/5315437/success-tick-dribbble.gif" alt="Order success" class="max-w-[400px] pointer-events-none select-none">
                    <h3 class="text-2xl md:text-5xl font-semibold">Thanks for your Order!</h3>
                    <h4 class="my-3 text-green-600 text-xl">Your order has been placed.</h4>

                    <div class="flex items-center justify-center gap-2 mt-10">
                        <a href="/" class="relative rounded px-5 py-2.5 overflow-hidden group bg-green-500 hover:bg-gradient-to-r hover:from-green-500 hover:to-green-400 text-white hover:ring-2 hover:ring-offset-2 hover:ring-green-400 transition-all ease-out duration-300">
                            <span class="absolute right-0 w-8 h-32 -mt-12 transition-all duration-1000 transform translate-x-12 bg-white opacity-10 rotate-12 group-hover:-translate-x-40 ease"></span>
                            <span class="relative">Back to Home</span>
                        </a>
                        <a href="/search?search=" class="px-5 py-2 hover:underline transition-all flex items-center gap-2">
                            Continue Shopping
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25 21 12m0 0-3.75 3.75M21 12H3" />
                            </svg>

                        </a>
                    </div>

                    {{--<div class="my-10">
                        <div>
                            <p>Congratulations! Your have successfully created an acoount in our database by default.</p>
                            <div class="max-w-[400px] mx-auto my-5 p-4 rounded-lg border ">
                                <div>
                                    <h2 class="text-xl font-bold text-center">Your Login Info</h2>
                                </div>
                                <div class="text-center mt-6 flex items-center gap-4 justify-center">
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="#bbb" class="size-10">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z" />
                                        </svg>
                                    </div>
                                    <div class="flex items-start flex-col">
                                        <h4>Number: <span>+88012345678</span></h4>
                                        <h4>Password: <span>12345678</span></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    --}}

                    <!-- Order summary  -->
                    <div class="mx-auto py-10 max-w-4xl flex-1 space-y-6 lg:mt-0 lg:w-full">
                        <div class="space-y-4 rounded-lg border border-gray-200 bg-white p-4 shadow-sm sm:p-6">
                            <p class="text-xl font-semibold text-gray-900">Order summary</p>

                            <div class="space-y-4">
                                <div class="space-y-2">
                                    @foreach($order->OrderProducts as $i => $product)
                                        <dl class="flex items-center justify-between gap-4 border px-2 py-2">
                                            <dt class="text-base font-normal text-gray-500">
                                                <img src="{{ $product->Product->img_paths['small'] ?? asset('img/default-img.png') }}" alt="{{ $product->Product->title ?? 'n/a' }}" class="w-20 h-20 object-contain">
                                            </dt>
                                            <dt class="text-base font-normal text-gray-500">
                                               <p class="text-lg">{{ $product->Product->title ?? 'n/a' }}</p>
                                                <p class="mb-0"><small>{{$product->ProductData->attribute_items_string}}</small></p>
                                                <p class="text-lg">৳ {{ $product->sale_price }} x {{$product->quantity}}</p>
                                            </dt>
                                            <dd class="text-base font-medium text-gray-900">৳ {{$product->sale_price * $product->quantity}}</dd>
                                        </dl>
                                    @endforeach

                                    <dl class="flex items-center justify-between gap-4">
                                        <dt class="text-base font-normal text-gray-500">Order Number</dt>
                                        <dd class="text-base font-medium text-gray-900">#{{$order->id}}</dd>
                                    </dl>
                                    <dl class="flex items-center justify-between gap-4 m">
                                        <dt class="text-base font-normal text-gray-500">Payment Method</dt>
                                        <dd class="text-base font-medium text-gray-900">Cash on Delivery</dd>
                                    </dl>
                                    <dl class="flex items-center justify-between gap-4">
                                        <dt class="text-base font-normal text-gray-500">Product Total</dt>
                                        <dd class="text-base font-medium text-gray-900">৳ {{$order->product_total}}</dd>
                                    </dl>
                                    <dl class="flex items-center justify-between gap-4">
                                        <dt class="text-base font-normal text-gray-500">Delivery Charge</dt>
                                        <dd class="text-base font-medium text-gray-900">৳ {{$order->shipping_charge}}</dd>
                                    </dl>
                                </div>

                                <dl class="flex items-center justify-between gap-4 border-t border-gray-200 pt-2 ">
                                    <dt class="text-base font-bold text-gray-900">Total</dt>
                                    <dd class="text-base font-bold text-gray-900">৳ {{ $order->grand_total }}</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <!-- Order summary end  -->
                </div>
            </div>
        </div>
    @else
        <div class="bg-green-600 rounded text-center mb-2 text-white py-3 text-lg md:text-2xl px-2">
            Thank You. Your order has been received.
        </div>

        <div class="overflow-auto">
            <table class="w-full border text-left mb-8">
                <thead class="border-b">
                <tr>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Product
                    </th>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Price
                    </th>
                </tr>
                </thead>
                <tbody>
                @foreach($order->OrderProducts as $i => $product)
                    <tr class="border-b">
                        <td class="px-3 py-2 text-sm text-gray-900 border-r font-light">
                            <img src="{{ $product->Product->img_paths['small'] ?? asset('img/default-img.png') }}" alt="{{ $product->Product->title ?? 'n/a' }}" class="w-20 h-20 object-contain">
                            <p class="text-lg">{{ $product->Product->title ?? 'n/a' }}</p>
                            <p class="mb-0"><small>{{$product->ProductData->attribute_items_string}}</small></p>
                            <p class="text-lg">৳ {{ $product->sale_price }} x {{$product->quantity}}</p>
                        </td>
                        <td class="text-gray-900 font-light px-3 py-2 whitespace-nowrap border-r text-lg">
                            ৳ {{$product->sale_price * $product->quantity}}
                        </td>
                    </tr>
                @endforeach
                </tbody>

                <tfoot>
                <tr class="border-b">
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Delivery Cost
                    </th>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        ৳ {{$order->shipping_charge}}
                    </th>
                </tr>
                <tr class="border-b">
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Total
                    </th>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        ৳ {{$order->grand_total}}
                    </th>
                </tr>
                <tr class="border-b">
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Order Number
                    </th>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        {{$order->id}}
                    </th>
                </tr>
                <tr>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Payment Method
                    </th>
                    <th scope="col" class="text-sm font-semibold text-gray-900 px-3 py-2 border-r">
                        Cash on Delivery
                    </th>
                </tr>
                </tfoot>
            </table>
        </div>

        <div class="text-center mb-8">
            <a href="{{route('homepage')}}" class="text-center rounded-md border-2 border-primary-light bg-primary-light px-3 py-2 text-sm font-medium text-white inline-block">Continue Shopping</a>
        </div>
    @endif
</div>
@endsection

@section('footer')
@if($track)
    @if(env('APP_FB_TRACK'))
    <script>
        fbq('track', 'Purchase', {
            value: '{{$order->grand_total}}',
            currency: 'BDT',
            contents: @json($products),
            content_ids: @json($content_ids)
        }, {eventID: '{{$order->id}}'});
    </script>
    @endif

    @if(Info::Settings('fb_api', 'track') == 'Yes')
    <script>
        // FB Conversion Track
        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('fbTrack') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    track_type: 'Purchase',
                    data: {
                        event_id: '{{$order->id}}',
                        custom_data: {
                            value: '{{$order->grand_total}}',
                            currency: 'BDT',
                            content_ids: @json($content_ids),
                            content_type: "product",
                            contents: @json($products),
                        }
                    }
                },
                success: function (response) {
                    if(response == 'true'){
                        console.log('FB Tracked Purchase!');
                    }else{
                        console.log('FB Tracked Purchase Failed');
                    }
                },
                error: function(){
                    console.log('FB Tracked Error Purchase!');
                }
            });
        });
    </script>
    @endif
@endif
@endsection
