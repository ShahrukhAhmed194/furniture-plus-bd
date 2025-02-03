<div class="flex flex-wrap justify-between items-center mx-auto max-w-screen-xl p-2">
    <div id="mega-menu-full" class="items-start md:items-center justify-between hidden w-full md:flex md:w-auto md:order-1">
        <ul class="flex flex-col text-left md:text-center uppercase md:flex-row md:mt-0 md:space-x-2 rtl:space-x-reverse">
            @foreach ($main_menu->SingleMenuItems as $key=>$menu_item)
                @if(count($menu_item->Items))
                    <li>
                        <a href="#" id="mega-menu-full-dropdown-button-{{$key}}" data-collapse-toggle="mega-menu-full-dropdown-{{$key}}" class="flex items-centercursor-pointer md:text-sm font-semibold justify-between w-full py-2 md:px-3 font-medium text-gray-900 border-b border-gray-100 md:w-auto hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-600 md:p-0 ">
                            {{$menu_item->menu_info['text']}}
                            <svg class="w-2.5 h-2.5 ms-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                            </svg>
                        </a>
                    </li>
                @else
                    <li>
                        <a href="{{$menu_item->menu_info['url']}}" class="block py-2 md:px-3 text-gray-900 border-b border-gray-100 hover:bg-gray-50 md:text-sm font-semibold md:hover:bg-transparent md:border-0 md:hover:text-blue-700 md:p-0" aria-current="page">{{$menu_item->menu_info['text']}}</a>
                    </li>
                @endif
            @endforeach
        </ul>
    </div>
</div>
@foreach ($main_menu->SingleMenuItems as $key=>$menu_item)
    @if(count($menu_item->Items))
        <div id="mega-menu-full-dropdown-{{$key}}" class="hidden mt-1 bg-white border-gray-200 shadow-sm border-y">
            <div class="grid max-w-screen-xl px-4 py-5 mx-auto text-gray-900 dark:text-white sm:grid-cols-2 md:grid-cols-3 md:px-6">
                @foreach ($menu_item->Items as $menu_item)
                    <ul>
                        <li>
                            <a href="{{$menu_item->menu_info['url']}}" class="block p-1 rounded-lg hover:bg-gray-50">
                                <div class="font-semibold text-black">{{$menu_item->menu_info['text']}}</div>
                                @if(count($menu_item->Items))
                                    @foreach ($menu_item->Items as $menu_item)
                                        <ul>
                                            <li>
                                                <a href="{{$menu_item->menu_info['url']}}" class="block p-1 ml-2 rounded-lg hover:bg-gray-50">
                                                    <div class="text-black">{{$menu_item->menu_info['text']}}</div>
                                                </a>
                                            </li>
                                        </ul>
                                    @endforeach
                                @endif
                            </a>
                        </li>
                    </ul>
                @endforeach
            </div>
        </div>
    @endif
@endforeach