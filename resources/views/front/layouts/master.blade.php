<!DOCTYPE html>
@php
    // $categories = App\Models\Product\Category::with('Categories', 'Categories.Categories')->where('for', 'product')->where('category_id', null)->active()->get();
    $cart_summary = App\Repositories\CartRepo::summary();
    $main_menu = cache()->remember('main_menu', (60 * 60 * 24 * 90), function(){
        return App\Models\Menu::with('SingleMenuItems', 'SingleMenuItems.Page', 'SingleMenuItems.Category')->where('name', 'Main Menu')->first();
    });
    $footer_menu = cache()->remember('footer_menu_cache', (60 * 60 * 24 * 90), function(){
        return App\Models\Menu::with('SingleMenuItems', 'SingleMenuItems.Page', 'SingleMenuItems.Category')->where('name', 'Footer Menu')->first();
    });
    $socials = cache()->remember('homepage_social', (60 * 60 * 24 * 90), function(){
        return Info::SettingsGroup('social');
    });

    $widgets = App\Models\Widget::with('Menu', 'Menu.SingleMenuItems')->where('status', 1)->where('placement', 'Footer')->orderBy('position')->get();
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
    @endphp
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <style>
        :root {
          --primary: {{$settings_g['primary_color'] ?? "#c04000"}};
          --primary_light: {{$settings_g['primary_light_color'] ?? "#ff686e"}};
          --secondary:{{$settings_g['secondary_color'] ?? "#21cd9c"}};
          --secondary_dark:{{$settings_g['secondary_dark_color'] ?? "#047857"}};
        }
    </style>

    <!-- Icons -->
    <link rel="shortcut icon" href="{{$settings_g['favicon'] ?? ''}}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.css" rel="stylesheet" />
    @vite('resources/front/css/app.css')
    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="{{ asset('mobile-menu/style.css') }}">
    @yield('head')

    {!! $settings_g['custom_head_code'] ?? '' !!}

    <script>
        let base_url = "{{route('homepage')}}";
        let _token = '{{csrf_token()}}';
    </script>
    <style>
        .hoverable:hover .mega-menu {
            opacity: 1;
            visibility: visible;
            z-index: 900;
        }


        /* #toggle Class Styles */

        .toggleable>label:after {
            content: "\25BC";
            font-size: 10px;
            padding-left: 6px;
            position: relative;
            top: -1px;
        }

        .toggle-input {
            display: none;
        }

        .toggle-input:not(checked)~.mega-menu {
            opacity: 0;
            visibility: hidden;
            z-index: -900;
        }

        .toggle-input:checked~.mega-menu {
            opacity: 1;
            visibility: visible;
            z-index: 900;
        }



        .toggle-input:checked~label:after {
            content: "\25B2";
            font-size: 10px;
            padding-left: 6px;
            position: relative;
            top: -1px;
        }

        .custom_class_a:hover {
            color: white !important;
        }

    </style>
</head>
<body class="test">
    {!! $settings_g['custom_body_code'] ?? '' !!}

    <div class="fixed top-0 left-0 bg-gray-500 bg-opacity-80 w-full h-full text-center z-50 pt-20 page_loader_hidden" id="page_loader">
        <svg class="animate-spin -ml-1 mr-3 h-8 w-8 text-white inline-block" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
        </svg>
    </div>
    <header class="relative bg-[white] sticky top-0 z-30">
        @if(isset($settings_g['headline']) && $settings_g['headline'])
            <p class="flex items-center justify-center text-white py-2 bg-[#222222] text-center" >{!! $settings_g['headline'] !!}</p>
        @endif
        <div class="bg-white relative">
            <nav aria-label="Top" class="{{ $container }}">
                <div class="py-2">
                    <div class="grid grid-cols-12 items-center relative">
                        @if($template == 3)
                            @include('front.template3.searchSection')
                        @else
                            @include('front.template1.searchSection')
                        @endif
                    </div>
                </div>
            </nav>
            <div class="{{ $container }}">
                <div class="mb-5">
                    @if(env('APP_MAIN_MENU') == 'Menu')
                        @if($main_menu)
                            @include('front.layouts.header-menu-3')
                            {{--@if($template == 3)
                                @include('front.layouts.header-menu-3')
                            @else
                                @include('front.layouts.header-menu-1')
                            @endif--}}
                        @endif
                    @endif
                </div>
                {{--@if($template == 3)--}}
                    <div class="mobile-nav-wrapper bg-[#06402B] text-white w-full overflow-y-scroll" role="navigation">
                        <div class="closemobileMenu">
                            <span class="icon an an-times-l pull-right">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                     stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                                </svg>
                            </span> Close Menu
                        </div>

                        <ul id="MobileNav" class="mobile-nav">
                            @if ($main_menu)
                                @foreach ($main_menu->SingleMenuItems as $item)
                                    <li class="relative">
                                        <a class="" style="color: white  !important;" href="{{ $item->menu_info['url'] }}">{{ $item->menu_info['text'] }} @if (count($item->Items)) <i class="an an-plus-l" style="color: white  !important;"></i> @endif</a>
                                        @if (count($item->Items))
                                            <ul class="hidden space-y-2 submenu">
                                                @foreach ($item->Items as $sub_item)
                                                    <li class="relative">
                                                        <a class="font-medium text-md flex items-center justify-between" style="color: white  !important;"
                                                           href="{{ $sub_item->menu_info['url'] }}">
                                                            {{ $sub_item->menu_info['text'] }}
                                                            @if (count($sub_item->Items))
                                                                <i class="an an-plus-l" style="color: white  !important;"></i>
                                                            @endif
                                                        </a>
                                                        @if (count($sub_item->Items))
                                                            <ul class="hidden pl-4 space-y-2 submenu">
                                                                @foreach ($sub_item->Items as $sub_sub_item)
                                                                    <li><a class="font-medium text-md" style="color: white  !important;"
                                                                           href="{{ $sub_sub_item->menu_info['url'] }}">{{ $sub_sub_item->menu_info['text'] }}</a>
                                                                    </li>
                                                                @endforeach
                                                            </ul>
                                                        @endif
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @endif
                                    </li>
                                @endforeach
                            @endif
                        </ul>
                    </div>
                {{--@endif--}}
            </div>
        </div>
    </header>

    <div class="bg-primary fixed top-0 left-0 z-50 w-full py-2 top_search_hidden" id="search_modal">
        <div class="{{ $container }}">
            <div class="grid grid-cols-12">
                <div class="flex col-span-10">
                    <form method="get" action="{{route('search')}}" class="relative w-full">
                      <input type="search" id="search-dropdown" name="search" class="block p-2 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-r-lg border-l-gray-50 border-l-2 border border-gray-300 focus:primary focus:primary" placeholder="Search Product" required="">

                      <button type="submit" class="absolute top-0 right-0 p-2 text-sm font-medium text-white bg-primary-light rounded-r-lg border border-primary-light focus:ring-4 focus:outline-none">
                          <svg aria-hidden="true" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                      </button>
                    </form>
                </div>
                <button class="col-span-2 text-right" onclick="toggleSearch()">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 text-white mt-1 ml-1 font-semibold inline-block">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>

            </div>
        </div>
    </div>
    @if(isset($settings_g['whatsapp_number']) && $settings_g['whatsapp_number'])
        <a target="_blank" href="https://api.whatsapp.com/send?phone={{ $settings_g['whatsapp_number'] }}&amp;text={{ Request::url() }}&amp;" class="fixed bottom-14 md:bottom-8 right-2 md:right-8 bg-green-600 hover:bg-green-700 text-white fill-current p-2 rounded-full shadow-xl inline-block z-20">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="w-10 h-10"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"></path></svg>
        </a>
    @endif

    @yield('master')

    @if($template == 3)
        @include('front.template3.footer')
    @else
        @include('front.template1.footer')
    @endif

    <script src="https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.min.js"></script>
    @if(Route::is('homepage'))
        @vite('resources/front/js/app.js')
    @endif
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- Sweetalert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.3.0/dist/sweetalert2.all.min.js"></script>

    <script src="{{asset('front/custom.js')}}?c=5"></script>
    <script src="{{ asset('mobile-menu/script.js') }}"></script>
    @if(session('success-alert'))
    <script>
        cAlert('success', "{{session('success-alert')}}");
    </script>
    @endif

    @if(session('error-alert'))
    <script>
        cAlert('error', "{{session('error-alert')}}");
    </script>
    @endif
    @if(session('error-alert2'))
        <script>
            Swal.fire(
                'Failed!',
                '{{session("error-alert2")}}',
                'error'
            )
        </script>
    @endif

    @if(session('success-alert2'))
        <script>
            Swal.fire(
                'Success!',
                '{{session("success-alert2")}}',
                'success'
            )
        </script>
    @endif
    <script>
        function addToCart(product_id){
            let single_cart_quantity = $('#single_cart_quantity').val()
            let product_data_id = $('.product_data_id').val()
            if(!product_data_id){
                product_data_id = null
            }

            $.ajax({
                url: '{{route("cart.add")}}',
                method: 'POST',
                dataType: 'JSON',
                data: {_token: '{{csrf_token()}}', product_id, quantity: single_cart_quantity, product_data_id},
                success: function(result){
                    cAlert('success', "Card added success!");
                    $('.top_cart_count').html(result.cart_count)
                },
                error: function(){
                    cAlert('success', "Something wrong!");
                }
            });
        }
        function addToCart2(product_id){
            let single_cart_quantity = $('.single_cart_quantity').val()
            let product_data_id = $('.product_data_id').val()
            if(!product_data_id){
                product_data_id = null
            }

            $.ajax({
                url: '{{route("cart.add")}}',
                method: 'POST',
                dataType: 'JSON',
                data: {_token: '{{csrf_token()}}', product_id, quantity: single_cart_quantity, product_data_id},
                success: function(result){
                    cAlert('success', "Card added success!");
                    $('.top_cart_count').html(result.cart_count)
                },
                error: function(){
                    cAlert('success', "Something wrong!");
                }
            });
        }
        let toggle_inc = 1;
        function hideshowMenu(){
            if(toggle_inc%2 == 1) $('#mobile_menu_collapse').removeClass('hidden')
            else $('#mobile_menu_collapse').addClass('hidden')
            toggle_inc +=1
        }
    </script>

    @yield('footer')

    @if(Info::Settings('fb_api', 'track') == 'Yes')
    <script>
        // FB Conversion Track(PageView)
        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('fbTrack') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    track_type: 'PageView'
                },
                success: function (response) {
                    if(response == 'true'){
                        console.log('FB Tracked!');
                    }else{
                        console.log('FB Tracked Failed');
                    }
                },
                error: function(){
                    console.log('FB Tracked Error!');
                }
            });
        });
    </script>
    @endif

    {!! $settings_g['custom_footer_code'] ?? '' !!}
    <script>
        function toggleMenu(){
            $("body").removeClass("menuOn");
            //let mobile_menu = document.getElementById("mobile_menu");
            //mobile_menu.classList.toggle('mobile_menu_hidden');
        }
        /*document.getElementById('menu-toggle').addEventListener('click', function() {
            document.getElementById('menu').classList.remove('hidden');
        });

        document.getElementById('menu-close').addEventListener('click', function() {
            document.getElementById('menu').classList.add('hidden');
        });*/

        document.querySelectorAll('.submenu-toggle').forEach(function(toggle) {
            toggle.addEventListener('click', function(event) {
                event.preventDefault();
                const submenu = this.parentElement.nextElementSibling;
                if (submenu.classList.contains('hidden')) {
                    submenu.classList.remove('hidden');
                } else {
                    submenu.classList.add('hidden');
                }
            });
        });
    </script>
</body>
</html>
