<div class="col-span-4 md:col-span-1 flex">
    {{--<button  type="button" id="page_loader menu-toggle" onclick="toggleMenu()" class="js-mobile-nav-toggle mobile-nav--close inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200" aria-controls="mega-menu-full" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
        </svg>
    </button>--}}
    <button type="button" id="page_loader menu-toggle" onclick="toggleMenu()"
            class="js-mobile-nav-toggle mobile-nav--close md:hidden flex items-center">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
             stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
    </button>
    <!-- Logo -->
    <div class="ml-4 lg:ml-0">
        <a href="{{route('homepage')}}">
            <img class="max-w-full object-contain object-left w-full h-[2.5rem] md:h-[7rem]" src="{{$settings_g['logo'] ?? ''}}" alt="{{$settings_g['title'] ?? env('APP_NAME')}}">
        </a>
    </div>
</div>
<div class="hidden md:block md:col-span-8 px-3">
    <form action="{{route('search')}}" class="border-[#22222226] border rounded-full justify-center overflow-hidden w-full max-w-full h-[3rem] hidden md:flex" method="get">
        <input type="text" name="search" value="{{request('search')}}" class="w-full focus:outline-none border-transparent focus:border-transparent focus:ring-0 p-2 mx-0 border-none placeholder:font-[300] font-[300]" placeholder="Search for products">

        <button type="submit" class="search-btn px-2">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-5 text-[#222222]">
                <path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z" />
            </svg>
        </button>
    </form>
</div>
<div class="col-span-8 md:col-span-3 lg:col-span-2">
    <div class="flex justify-end mx-2 md:gap-2">
        <div class="flex">
            <!-- Search -->
            <div class="flex lg:ml-6 md:hidden">
                <a href="#" class="p-2 pt-0 text-gray-600 hover:text-gray-800" onclick="toggleSearch()">
                    <svg class="w-6 h-6 mt-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg>
                </a>
            </div>

            <!-- User Icon -->
            @auth
            <div class="ml-4 flow-root lg:ml-6 py-2">
                <a href="{{route('auth.dashboard')}}" class="group -m-2 p-2 flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 mr-2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                    </svg>
                    <span class="text-[#222] font-light hidden md:inline-block">Dashboard</span>
                </a>
            @else
                <a href="{{route('login')}}" class="group -m-2 p-2 flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 mr-2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                    </svg>
                    <span class="text-[#222] font-light hidden md:inline-block">Sign in/Sign up</span>
                </a>
            @endauth
                </div>

                <!-- Cart -->
                <div class="ml-2 flow-root lg:ml-6 py-2">
                    <a href="{{route('cart')}}" class="group -m-2 p-2 flex items-center relative">
                        <svg class="flex-shrink-0 h-6 w-6 text-gray-600 group-hover:text-gray-800" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                        </svg>

                        <span class="ml-2 font-medium top_cart_count bg-[#222] w-[15px] h-[15px] text-center text-white leading-[18px] text-xs rounded-full absolute top-3 right-0">{{$cart_summary['count']}}</span>
                    </a>
                </div>
        </div>
    </div>
</div>