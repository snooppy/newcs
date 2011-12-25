(function(jq) {
    jq.autoScroll = function(ops) {
        ops = ops || {};
        ops.styleClass = ops.styleClass || 'scroll-to-top-button';
        var t = jq('<div class="'+ops.styleClass+'"></div>'),
        d = jq(ops.target || document);
        jq(ops.container || 'body').append(t);

        t.css({
            opacity: 0,
            position: 'absolute',
            top: 0,
            right: 0
        }).click(function() {
            jq('html,body').animate({
                scrollTop: 0
            }, ops.scrollDuration || 1000);
        });

        d.scroll(function() {
            var sv = d.scrollTop();
            if (sv < 10) {
                t.clearQueue().fadeOut(ops.hideDuration || 200);
                return;
            }

            t.css('display', '').clearQueue().animate({
                top: sv,
                opacity: 0.8
            }, ops.showDuration || 500);
        });
    };
})(jQuery);
      
function theRotator() {
    // Устанавливаем прозрачность всех картинок в 0
    $('div#rotator ul li').css({
        opacity: 0.0
    });
 
    // Берем первую картинку и показываем ее (по пути включаем полную видимость)
    $('div#rotator ul li:first').css({
        opacity: 1.0
    });
 
    // Вызываем функцию rotate для запуска слайдшоу, 5000 = смена картинок происходит раз в 5 секунд
    setInterval('rotate()',5000);
}
 
function rotate() {	
    // Берем первую картинку
    var current = ($('div#rotator ul li.show')?  $('div#rotator ul li.show') : $('div#rotator ul li:first'));
 
    // Берем следующую картинку, когда дойдем до последней начинаем с начала
    var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div#rotator ul li:first') :current.next()) : $('div#rotator ul li:first'));	
 
    // Расскомментируйте, чтобы показвать картинки в случайном порядке
    // var sibs = current.siblings();
    // var rndNum = Math.floor(Math.random() * sibs.length );
    // var next = $( sibs[ rndNum ] );
 
    // Подключаем эффект растворения/затухания для показа картинок, css-класс show имеет больший z-index
    next.css({
        opacity: 0.0
    })
    .addClass('show')
    .animate({
        opacity: 1.0
    }, 1000);
 
    // Прячем текущую картинку
    current.animate({
        opacity: 0.0
    }, 1000)
    .removeClass('show');
};
 
$(document).ready(function() {		
    // Запускаем слайдшоу
    theRotator();
        
    $.autoScroll({
        scrollDuration: 2000, 
        showDuration: 600, 
        hideDuration: 300
    }); 
});
      
  
  
function index_show_menu(p_this,obj,pos){
    $(".index_slide_up_checked").removeClass(".index_slide_up_checked");
    $(obj).slideToggle();
    $(obj).addClass(".index_slide_up_checked");
    $(p_this).parent().addClass(".index_menu_checked");
}