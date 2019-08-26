"use strict";

Function.prototype.inherits = function (parentClassOrObject) {
    if (parentClassOrObject.constructor == Function) {
        //Normal Inheritance 
        /*this.prototype = new parentClassOrObject;
        this.prototype.constructor = this;
        this.prototype.parent = parentClassOrObject.prototype;*/

        var extendsFrom = function extendsFrom() {};
        extendsFrom.prototype = parentClassOrObject.prototype;
        this.prototype = new extendsFrom();
        this.prototype.constructor = this;
        this.fn = this.prototype;
        //this.fn.super = parentClassOrObject.constructor;


        /*this.prototype = parentClassOrObject.prototype;
        this.prototype.constructor = this;
        this.fn = this.prototype;
        this.prototype.parent = parentClassOrObject.prototype;*/
    } else {
        //Pure Virtual Inheritance 
        this.prototype = parentClassOrObject;
        this.prototype.constructor = this;
        this.fn = this.prototype;
        this.prototype.parent = parentClassOrObject;
    }
    return this;
};

var General = function General() {};
General.isNullEmptyUndefined = function (_val, defaultText) {
    if (defaultText != undefined) {
        return _val == undefined || _val == null || _val === "" || _val === defaultText;
    }
    return _val == undefined || _val == null || _val === "";
};
General.getScrollBarWidth = function () {
    var $outer = $('<div>').css({ visibility: 'hidden', width: 100, overflow: 'scroll' }).appendTo('body'),
        widthWithScroll = $('<div>').css({ width: '100%' }).appendTo($outer).outerWidth();
    $outer.remove();
    return 100 - widthWithScroll;
};
General.waitForFinalEvent = function () {
    var timers = {};
    return function (callback, ms, uniqueId) {
        if (!uniqueId) {
            uniqueId = "Don't call this twice without a uniqueId";
        }
        if (timers[uniqueId]) {
            clearTimeout(timers[uniqueId]);
        }
        timers[uniqueId] = setTimeout(callback, ms);
    };
}();

function detectIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    if (msie > 0) {
        // IE 10 or older => return version number
        //return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
        return "is-ie ie-10";
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        return "is-ie ie-11";
        //return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        //Edge (IE 12+) => return version number
        return "is-ie ie-12";
        //return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    // other browser
    return false;
}

function calculateBar($this, $bar) {
    var width = $this.outerWidth();
    var left = $this.position().left;
    var barWidth = $bar.width();
    var position = left + width / 2 - barWidth / 2;
    $bar.css({ "transform": "translateX(" + position + "px)" });
    return;
}

function checkDrag(draggable, $listWrapper, $listItems) {
    if ($listItems.length * $listItems.first().outerWidth() < $(window).width()) {
        $listWrapper.addClass("no-drag");
        draggable.kill();
    } else {
        $listWrapper.removeClass("no-drag");
        draggable.enable();
    }
}

var LayoutPageBase = function LayoutPageBase() {
    this.baseUrl = $("#base-url").val();
    this.isMobile = $("#is-mobile").val() == "true" ? true : false;
    this.mapStyle = "mapbox://styles/timboslice/cjr9q67wb1rjg2so1o6tnfv7p";
    this.splitTextArr = [];
    this.hasResized = false;
    this.scrollOffset = $("#is-mobile").val() == "true" ? 0 : 0;
    this.revealController = new ScrollMagic.Controller({
        globalSceneOptions: {
            triggerHook: $("#is-mobile").val() == "true" ? 1 : .95
        }
    });
};

LayoutPageBase.prototype = {
    layoutBaseInit: function layoutBaseInit() {
        var loc = this;
        console.log('%c Website by lookthinkmake', 'padding:9px 5px; line-height:25px; background: #3c3c3c; color: #f8ca2b;');

        var IEclass = detectIE();
        if (IEclass !== false) {
            $("html").addClass(IEclass);
        }

        $("body").on("click", "#burger", function (e) {
            e.preventDefault();
            $("body").toggleClass("nav-open");
        });

        $("body").on("focus", "input", function () {
            if ($(this).parents().hasClass("animate-label")) {
                $(this).parents(".animate-label").addClass("blur");
                //$(this).attr("placeholder", "");
            }
        });

        $("body").on("blur", "input", function () {
            if ($(this).parents().hasClass("animate-label") && $(this).val() == "") {
                $(this).parents(".animate-label").removeClass("blur");
            }
        });

        $(window).resize(function () {
            clearTimeout(window.resizedFinished);
            window.resizedFinished = setTimeout(function () {
                if (loc.hasResized === false) {
                    for (var i = 0; i < loc.splitTextArr.length; i++) {
                        loc.splitTextArr[i].revert();
                    }
                    loc.has_resized = true;
                }
            }, 150);
        });
    },
    modulesInit: function modulesInit() {
        var loc = this;

        $(".module").each(function () {
            var module = $(this).data("type");
            switch (module) {
                case "page-hero-module":
                    pageHeroModule(this);
                    break;

                case "image-text-module":
                    imageTextModule(this);
                    break;

                case "text-module":
                    textModule(this);
                    break;

                case "points-of-interest-module":
                    pointsOfInterestModule(this);
                    break;

                case "form-module":
                    formModule(this);
                    break;

                default:
                    //do nothing
                    break;
            }
        });

        function pageHeroModule(module) {}

        function imageTextModule(module) {
            var tl1 = new TimelineLite();

            var $content = $(module).find(".content-wrapper > *");
            var $imageCover = $(module).find(".img-cover");
            var $image = $(module).find(".img-wrapper img");
            var imageDirection = "-100%";
            var contentDirection = -8;

            if ($(module).hasClass("image-left")) {
                imageDirection = "100%";
                contentDirection = 8;
            }

            if ($(module).find(".img-wrapper").hasClass("vertical")) {
                objectFitImages($image);
            }

            var scene = new ScrollMagic.Scene({ triggerElement: module, offset: loc.scrollOffset, reverse: false }).on("start", function (e) {
                tl1.fromTo($imageCover, 1, { x: 0, ease: Expo.easeOut }, { x: imageDirection, ease: Expo.easeOut }, "+=0");
                // tl1.fromTo($image, .5, { opacity: 0, ease: Expo.easeOut }, { opacity: 1, ease: Expo.easeOut }, "-=.1");
                tl1.staggerFromTo($content, .5, { opacity: 0, x: contentDirection, ease: Back.easeOut }, { opacity: 1, x: 0, ease: Back.easeOut }, .2, "-=.4");
            }).addTo(loc.revealController);
        }

        function textModule(module) {
            var tl1 = new TimelineLite();
            var $content = $(module).find(".content-wrapper > *");

            var scene = new ScrollMagic.Scene({ triggerElement: module, offset: loc.scrollOffset, reverse: false }).on("start", function (e) {
                tl1.staggerFromTo($content, .5, { opacity: 0 }, { opacity: 1 }, .075);
            }).addTo(loc.revealController);
        }

        function formModule(module) {
            var tl1 = new TimelineLite();
            var $content = $(module).find(".content-wrapper > *");
            var $form = $(module).find(".form-wrapper");

            if ($("html").hasClass("is-ie")) {
                var $img = $(module).find(".img-wrapper.bg-img img");
                objectFitImages($img);
            }
        }

        function pointsOfInterestModule(module) {
            //var tl1 = new TimelineLite();
            var categories = [];
            var poi = [];
            var map;
            var _css;
            //var $poiListFade = $(module).find(".poi-list li");
            //var $poiCategoryFade = $(module).find(".category-list li");
            //var $mapFade = $(module).find(".map-wrapper");

            calculateBar($(".category-list li.showing"), $(module).find(".highlight-bar"));

            // var scene = new ScrollMagic.Scene({triggerElement: module, offset: loc.scrollOffset, reverse: false})
            // .on("start", function (e) {
            //     tl1.fromTo($mapFade, .5, { opacity: 0 }, { opacity: 1 }, .2, "+=0");
            //     tl1.staggerFromTo($poiCategoryFade, .5, { opacity: 0, y: 8, ease: Back.easeOut }, { opacity: 1, y: 0, ease: Back.easeOut }, .1, "-=.1");
            //     tl1.staggerFromTo($poiListFade, .5, { opacity: 0, y: 8, ease: Back.easeOut }, { opacity: 1, y: 0, ease: Back.easeOut }, .1, "-=.1");
            // })
            // .addTo(loc.revealController);

            var $list = $(module).find(".poi-list-wrapper");

            $(module).find(".poi-list li:not(.extra-spacer)").each(function () {
                var displayType = $(this).data("displaycategory");
                var type = $(this).data("type").replace(/[ &]/g, "-").toLowerCase();
                var name = $(this).find("h4").text();
                var address = $(this).find(".address").html();
                var website = $(this).find(".cta").attr("href");
                var lat = parseFloat($(this).data("lat"));
                var lng = parseFloat($(this).data("lng"));

                var poi_obj = {
                    type: "Feature",
                    properties: {
                        name: name,
                        contentArea: '<div class="poi-popup-wrapper flex space-between"><div class="content-wrapper"><h6>' + displayType + '</h6><h4>' + name + '</h4><p class="text-small">' + address + '</p></div></div>',
                        type: type
                    },
                    geometry: {
                        type: "Point",
                        coordinates: [lng, lat]
                    }
                };

                poi.push(poi_obj);
            });

            $(module).find(".category-list li").each(function () {
                if ($(this).data("category") !== "all") {
                    var category = {
                        'type': $(this).data("category").replace(/[ &]/g, "-").toLowerCase()
                    };
                    categories.push(category);
                }
            });

            $.when($.get("https://api.tiles.mapbox.com/mapbox-gl-js/v0.49.0/mapbox-gl.css", function (css) {
                _css = css;
            }), $.getScript("https://api.tiles.mapbox.com/mapbox-gl-js/v0.49.0/mapbox-gl.js")).then(function () {
                $("<style />").html(_css).appendTo("head");
                mapboxgl.accessToken = 'pk.eyJ1IjoidGltYm9zbGljZSIsImEiOiJjaW4wczdmdWgwYWxvd2tsdW44NGYxMGlrIn0.liwZ5JZ1iBylzGSps950aw';
                //var start_lat = $(".poi-module .map-wrapper").data("splat");
                //var start_lng = $(".poi-module .map-wrapper").data("splng");

                map = new mapboxgl.Map({
                    container: 'map',
                    zoom: 13,
                    center: [-97.740623, 30.281451],
                    style: loc.mapStyle,
                    hash: false
                });

                createPoiBlocks(map, categories, poi);
            });

            $(module).on("click", ".category-list li", function () {
                var category = $(this).data("category");
                var categoryName = $(this).find("h6").text();
                var $list = $(this).parents(".module").find(".poi-list");
                var filteredPois = [];

                $(".category-list li").removeClass("showing");
                $(this).addClass("showing");
                calculateBar($(this), $(module).find(".highlight-bar"));

                //tl1.staggerFromTo($poiListFade, .25, { opacity: 1, y: 0, ease: Back.easeOut }, { opacity: 0, y: 8, ease: Back.easeOut }, .05, "+=0", filterPoiList, [category, $list, tl1]);
                //tl1.staggerFromTo($poiListFade, .25, { opacity: 1, y: 0, ease: Back.easeOut }, { opacity: 0, y: 8, ease: Back.easeOut }, .05, "+=0");
                filterPoiList(category, $list, draggable);

                // $list.removeClass("fade-in").addClass("fade-out");
                // setTimeout(function() { 
                //     filterPoiList(category, $list);
                //     $list.removeClass("fade-out").addClass("fade-in");

                //     setTimeout(function() { $list.addClass("fade-in") }, 200);
                // }, 750);


                var category = $(this).data("category").replace(/[ &]/g, "-");
                var bounds = new mapboxgl.LngLatBounds();

                poi.forEach(function (feature) {
                    if (category == "all" || category == feature.properties.type) {
                        bounds.extend(feature.geometry.coordinates);
                        filteredPois.push(feature);
                    }
                });

                map.fitBounds(bounds, {
                    padding: 100
                });

                map.getSource("pois").setData({
                    type: "FeatureCollection",
                    features: filteredPois
                });
            });

            $(module).find(".category-list").scroll(function () {
                clearTimeout(window.scrollFinished);
                window.scrollFinished = setTimeout(function () {
                    calculateBar($(".category-list li.showing"), $(module).find(".highlight-bar"));
                }, 100);
            });

            $(module).on("click", ".poi-list li", function (e) {
                e.preventDefault();
                var coords = [$(this).data("lng"), $(this).data("lat")];
                map.flyTo({
                    center: coords,
                    zoom: 18
                });
            });
        }

        function createPoiBlocks(map, categories, poi) {

            map.on('load', function () {
                map.scrollZoom.disable();
                map.addControl(new mapboxgl.NavigationControl());

                var popup = new mapboxgl.Popup({
                    closeButton: false,
                    closeOnClick: false,
                    offset: [0, -20],
                    anchor: 'bottom'
                });

                map.addSource("pois", {
                    type: "geojson",
                    data: {
                        type: "FeatureCollection",
                        features: poi
                    },
                    cluster: true
                    //clusterMaxZoom: 22, // Max zoom to cluster points on
                    //clusterRadius: 50 
                });

                //---------------
                map.addLayer({
                    id: "clusters",
                    type: "circle",
                    source: "pois",
                    filter: ["has", "point_count"],
                    paint: {
                        "circle-color": {
                            property: "point_count",
                            type: "interval",
                            stops: [[0, "#BF5700"], [100, "#BF5700"], [750, "#BF5700"]]
                        },
                        "circle-radius": {
                            property: "point_count",
                            type: "interval",
                            stops: [[0, 20], [100, 30], [750, 40]]
                        }
                    }
                });

                map.addLayer({
                    id: "cluster-count",
                    type: "symbol",
                    source: "pois",
                    filter: ["has", "point_count"],
                    layout: {
                        "text-field": "{point_count_abbreviated}",
                        //     "text-font": ["Karmina Bold"],
                        "text-size": 12
                    },
                    paint: {
                        "text-color": "#ffffff"
                    }
                });
                //---------------

                // map.loadImage($("#base-url").val() + "/assets/other-images/star-icon-orange.png", (error, image) => {
                //     if (error) throw error;
                //     map.addImage("marker", image);
                // });

                poi.forEach(function (feature) {
                    var layerID = "poi-" + feature.properties.type.replace(/[ &]/g, "-");
                    if (!map.getLayer(layerID)) {
                        map.addLayer({
                            "id": layerID,
                            "type": "symbol",
                            "source": "pois",
                            "layout": {
                                "icon-image": "marker",
                                "icon-size": .5,
                                "icon-allow-overlap": true,
                                "icon-ignore-placement": true
                            },
                            "filter": ["==", "type", feature.properties.type]
                        });
                    }
                });

                for (var i = 0; i < categories.length; i++) {
                    var category = "poi-" + categories[i].type.replace(/[ &]/g, "-");
                    map.on("mouseenter", category, function (e) {
                        // Change the cursor style as a UI indicator.
                        map.getCanvas().style.cursor = 'pointer';

                        // Populate the popup and set its coordinates
                        // based on the feature found.
                        popup.setLngLat(e.features[0].geometry.coordinates).setHTML(e.features[0].properties.contentArea).addTo(map);
                    });

                    map.on("mouseleave", category, function () {
                        map.getCanvas().style.cursor = "";
                        popup.remove();
                    });

                    map.on("click", category, function (e) {

                        // Populate the popup and set its coordinates
                        // based on the feature found.
                        popup.setLngLat(e.features[0].geometry.coordinates).setHTML(e.features[0].properties.contentArea).addTo(map);

                        map.flyTo({ center: e.features[0].geometry.coordinates });
                    });
                }

                // map.loadImage($("#base-url").val() + "/assets/other-images/star-icon-green.png", function(error, image) {
                //     if (error) throw error;
                //     var attcoords = [-97.740371, 30.282013];
                //     var attPopUpContent = $("body").find(".map-wrapper").data("hotelpopup");
                //     map.addImage("custom-marker", image);
                //     map.addLayer({
                //         id: "attcenter",
                //         type: "symbol",
                //         source: {
                //             type: "geojson",
                //             data: {
                //             type: "FeatureCollection",
                //             features: [{
                //                 "type": "Feature",
                //                 "geometry": {
                //                     "type": "Point",
                //                     "coordinates": attcoords
                //                     }
                //                 }]
                //             }
                //         },
                //     layout: {
                //         "icon-image": "custom-marker",
                //         "icon-size": .5,
                //     } 
                //     });

                //     var popup = new mapboxgl.Popup({
                //         closeButton: false,
                //         closeOnClick: false,
                //         offset: [0, -20],
                //         anchor: 'bottom'
                //     });

                //     map.on("mouseenter", "attcenter", function (e) {
                //         map.getCanvas().style.cursor = 'pointer';

                //         popup.setLngLat(attcoords)
                //             .setHTML(attPopUpContent)
                //             .addTo(map);
                //     });

                //     map.on("mouseleave", "attcenter", function() {
                //         map.getCanvas().style.cursor = "";
                //         popup.remove();
                //     });  

                //     map.on("click", "attcenter", function (e) {
                //         popup.setLngLat(attcoords)
                //             .setHTML(attPopUpContent)
                //             .addTo(map);

                //         map.flyTo({ center: attcoords });
                //     });
                // });
            });
        }

        function filterPoiList(category, $list, draggable) {
            var tl1 = new TimelineLite();
            if (category == "all") {
                $list = $list.find("> li").not(".extra-spacer").addClass("show-item").removeClass("hide-item");
            } else {
                $list = $list.find("> li").not(".extra-spacer").filter(function (index) {
                    if ($(this).data("type") != category) {
                        $(this).removeClass("show-item").addClass("hide-item").attr("style", "");
                    } else {
                        $(this).addClass("show-item").removeClass("hide-item");
                    }
                });
            }

            draggable[0].kill();
            draggable = Draggable.create($(".poi-list-wrapper"), {
                type: "scrollLeft",
                edgeResistance: .75,
                throwProps: true,
                lockAxis: true,
                zIndexBoost: false,
                allowContextMenu: true
            });
            return;
        };
    }

};

var DefaultPage = function DefaultPage() {
    LayoutPageBase.call(this);
};

DefaultPage.inherits(LayoutPageBase);
DefaultPage.fn.init = function () {
    var loc = this;
    loc.layoutBaseInit();

    loc.modulesInit();
};

var ModulePage = function ModulePage() {
    LayoutPageBase.call(this);
};

ModulePage.inherits(LayoutPageBase);
ModulePage.fn.init = function () {
    var loc = this;
    loc.layoutBaseInit();

    loc.modulesInit();
};

var BlogPage = function BlogPage() {
    LayoutPageBase.call(this);
};

BlogPage.inherits(LayoutPageBase);
BlogPage.fn.init = function () {
    var loc = this;
    loc.layoutBaseInit();

    loc.modulesInit();
};