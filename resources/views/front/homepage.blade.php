@extends('front.layouts.master')

@section('head')
    @include('meta::manager', [
        'title' => ($settings_g['title'] ?? env('APP_NAME')) . ' - ' . ($settings_g['slogan'] ?? env('APP_NAME')),
        'description' => $settings_g['meta_description'] ?? '',
        'keywords' => $settings_g['keywords'] ?? '',
    ])

    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css')}}">

@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
    <div class="{{ $container }}">
        <div id="carouselExampleCaptions" class="relative" data-te-carousel-init data-te-ride="carousel">
            <div class="relative w-full overflow-hidden after:clear-both after:block after:content-['']">
                @foreach ($sliders as $slider)
                    <div class="relative float-left -mr-[100%] {{ $loop->index == 0 ? '' : 'hidden' }} w-full transition-transform duration-[600ms] ease-in-out motion-reduce:transition-none"
                         {{ $loop->index == 0 ? 'data-te-carousel-active' : '' }} data-te-carousel-item
                         style="backface-visibility: hidden;">
                        <img src="{{$slider->img_paths['original']}}" class="w-full object-cover object-fit md:h-[22.75rem]" alt="{{$slider->text_1}}"/>
                    </div>
                @endforeach

                <button
                    class="absolute bottom-0 left-0 top-0 z-[1] flex w-[15%] items-center justify-center border-0 bg-none p-0 text-center text-white opacity-50 transition-opacity duration-150 ease-[cubic-bezier(0.25,0.1,0.25,1.0)] hover:text-white hover:no-underline hover:opacity-90 hover:outline-none focus:text-white focus:no-underline focus:opacity-90 focus:outline-none motion-reduce:transition-none"
                    type="button" data-te-target="#carouselExampleCaptions" data-te-slide="prev">
                    <span class="inline-block h-8 w-8">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="h-6 w-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
                        </svg>
                    </span>
                    <span
                        class="!absolute !-m-px !h-px !w-px !overflow-hidden !whitespace-nowrap !border-0 !p-0 ![clip:rect(0,0,0,0)]">Previous</span>
                </button>

                <button
                    class="absolute bottom-0 right-0 top-0 z-[1] flex w-[15%] items-center justify-center border-0 bg-none p-0 text-center text-white opacity-50 transition-opacity duration-150 ease-[cubic-bezier(0.25,0.1,0.25,1.0)] hover:text-white hover:no-underline hover:opacity-90 hover:outline-none focus:text-white focus:no-underline focus:opacity-90 focus:outline-none motion-reduce:transition-none"
                    type="button" data-te-target="#carouselExampleCaptions" data-te-slide="next">
                    <span class="inline-block h-8 w-8">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="currentColor" class="h-6 w-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                        </svg>
                    </span>
                    <span
                        class="!absolute !-m-px !h-px !w-px !overflow-hidden !whitespace-nowrap !border-0 !p-0 ![clip:rect(0,0,0,0)]">Next</span>
                </button>
            </div>
        </div>
    </div>
    @if($template == 2)
        @include('front.template2.home')
    @elseif($template == 3)
        @include('front.template3.home')
    @else @include('front.template1.home')
    @endif

    <div>
    <section class="logo-slider">
        @include('front.logoSlider')
    </section>
@endsection

@section('footer')

    <script src="{{asset('front/OwlCarousel/dist/owl.carousel.min.js')}}"></script>

    @if(isset($settings_g['template']) && $settings_g['template'] == 2)
        <script>
            function loadCaro(){
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
                            items: 3,
                            margin: 20,
                        },
                        1000: {
                            items: 5,
                            margin: 30,
                        }
                    },
                    lazyLoad: false
                });
            }
        </script>
    @elseif(isset($settings_g['template']) && $settings_g['template'] == 3)
        <script>
            function loadCaro(){
                $('.owl-carousel_normal').owlCarousel({
                    items: 4,
                    loop: true,
                    video: true,
                    autoplay: false,
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
                            items: 3,
                            margin: 20,
                        },
                        1000: {
                            items: 6,
                            margin: 30,
                        }
                    },
                    lazyLoad: false
                });
            }
        </script>
    @else
        <script>
            function loadCaro(){
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
                            items: 3,
                            margin: 20,
                        },
                        1000: {
                            items: 5,
                            margin: 30,
                        }
                    },
                    lazyLoad: false
                });
            }
        </script>
    @endif
    <script>

        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('homeblocks') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    per_page: 5,
                    page: 2,
                },
                success: function (response) {
                    $('.load_home_items').html(response)
                    loadCaro()
                },
                error: function () {

                }
            })
        })
    </script>
@endsection