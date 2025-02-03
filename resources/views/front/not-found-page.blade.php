@extends('front.layouts.master')
@section('head')
    @include('meta::manager', [
        'title' => ($settings_g['title'] ?? env('APP_NAME')) . ' - ' . ($settings_g['slogan'] ?? env('APP_NAME')),
        'description' => $settings_g['meta_description'] ?? '',
        'keywords' => $settings_g['keywords'] ?? '',
    ])

    <link href="{{asset('front/magiczoomplus.css')}}?c=1" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css')}}">
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="{{ $container }}">
    @include('front.layouts.breadcrumb', [
        'title' => 'Unavailable',
        'url' => '#'
    ])
    <div class="py-10">
        <div class="border">
            <h2 class="bg-primary py-1 px-2 font-semibold text-white mb-2">Content Unavailable</h2>
            <div class="px-3 mb-2 py-10">
                This page/category might have been updated or removed. Please return to our
                <a href="/"> homepage </a> or check out other page/categories to find what you’re looking for.
            </div>
        </div>
    </div>

    <div class="mt-6">
        @php
            $related_products = \App\Models\Product\Product::where('status', 1)
            ->where('deleted_at', null)->distinct()
            ->inRandomOrder()
            ->take(10)->get();
        @endphp
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Related Products</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>
            @if($template == 2)
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template2.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @elseif($template == 3)
                <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6 gap-2 md:gap-6">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template3.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @else
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.layouts.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @endif
    </div>
</div>
@endsection

@section('footer')
    <script src="{{asset('front/OwlCarousel/dist/owl.carousel.min.js')}}"></script>

    <script src="{{asset('front/magiczoomplus.js')}}?c=1"></script>

    <script>
        $('.owl-carousel_normal').owlCarousel({
            items: 4,
            loop: true,
            video: true,
            autoplay: true,
            autoplayTimeout: 2000,
            autoplayHoverPause: true,
            margin: 10,
            nav: true,
            dots: true,
            responsive: {
                0: {
                    items: 2,
                    margin: 10,
                },
                600: {
                    items: 2,
                    margin: 20,
                },
                1000: {
                    items: 5,
                    margin: 30,
                }
            },
            lazyLoad: false
        });
    </script>

    <script src="{{asset('front/fitvids.js/jquery.fitvids.js')}}"></script>
    <script>
        $(document).ready(function(){
            $(".responsive_video").fitVids()
        });
    </script>
@endsection
