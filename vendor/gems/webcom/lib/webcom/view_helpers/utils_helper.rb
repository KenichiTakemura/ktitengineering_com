module Webcom
  module ViewHelpers
    module UtilsHelper
  
      def link_to_with_icon_remote_method(t,h,c,s,i,m="post")
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" rel="noffollow" data-remote="true" data-method="#{m}"><i class="#{i}"></i>#{t}</a>|
        html.html_safe
      end

      def link_to_with_icon_remote_with_confirm(t,h,c,s,i,d,m,confirm)
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" id="#{d}" rel="noffollow" data-remote="true" data-method="#{m}" data-confirm="#{confirm}"><i class="#{i}"></i>#{t}</a>|
        html.html_safe
      end
      
      def link_to_with(t,h,c,s,d="")
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" id="#{d}">#{t}</a>|
        html.html_safe
      end
      
      def link_to_with_icon(t,h,c,s,i,d="")
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" id="#{d}"><i class="#{i}"></i> #{t}</a>|
        html.html_safe
      end
      
      def link_to_with_icon_with_method(t,h,c,s,i,d,m)
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" data-method="#{m}" id="#{d}"><i class="#{i}"></i>#{t}</a>|
        html.html_safe
      end
  
      def link_to_remote(t,h,c,s)
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" rel="noffollow" data-remote="true" data-method="post">#{t}</a>|
        html.html_safe
      end

      def link_to_with_icon_remote(t,h,c,s,i,d,m="post")
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" rel="noffollow" data-remote="true" data-method="#{m}" id="#{d}"><i class="#{i}"></i>&nbsp;#{t}</a>|
        html.html_safe
      end

      def link_to_modal(t,h,c,s,i,d)
        html = %Q|<a href="#{h}" class="#{c}" style="#{s}" role="button" data-toggle="modal" id="#{d}"><i class="#{i}"></i>#{t}</a>|
        html.html_safe
      end

      def show_notice(message=nil)
        html = ""
        msg = message.presence || notice.presence || nil
        if msg
          html = %Q|<div class="alert alert-info alert-block fade in"><button type="button" class="close" data-dismiss="alert">×</button><h4>#{msg}</h4></div>|
        end
        html.html_safe
      end

      def show_mobile_notice(message=nil)
        html = ""
        msg = message.presence || notice.presence || nil
        if msg
          html = %Q|<div data-role="popup" id="popup-notice" data-position-to="window"><div class="" data-role="header"><h3>#{t("form.error")}</h3></div>
          <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a><div class="" data-role="content">#{msg}</div></div>|
        end
        html.html_safe
      end

      def show_alert(message=nil)
        html = ""
        msg = message.presence || alert.presence || nil
        if msg
          html = %Q|<div class="alert alert-block"><button type="button" class="close" data-dismiss="alert">×</button><h4>#{msg}</h4></div>|
        end
        html.html_safe
      end

      def _script_document_ready(script)
        html = %Q|<script type="text/javascript" charset="utf-8">$(document).ready(function() {#{script}});</script>|
        html.html_safe
      end

      def _document_pageinit(script)
        html = %Q|<script type="text/javascript" charset="utf-8">$(document).bind('pageinit', function() {#{script}});</script>|
        html.html_safe
      end

      def _document_on(event,selecter,handler)
        html = %Q|<script type="text/javascript" charset="utf-8">$(document).on("#{event}","#{selecter}",#{handler});</script>|
        html.html_safe
      end

      def _on(event,selecter,handler)
        html = %Q|<script type="text/javascript" charset="utf-8">.on("#{event}","#{selecter}",#{handler});</script>|
        html.html_safe
      end
        
      def i18n_currency(c)
        return number_to_currency(c, :locale => I18n.locale, :precision => 2).html_safe
      end

      def _script(script)
        %Q|<script type="text/javascript" charset="utf-8">#{script}</script>|.html_safe
      end

      def _mobile_tap(element_id,func)
        _script(%Q|$('\##{element_id}').live('tap',function(event) {
          var lastclickpoint = $(this).attr('data-clickpoint');
          var curclickpoint = event.clientX+'x'+event.clientY
          if (lastclickpoint == curclickpoint) return false;
          $(this).attr('data-clickpoint',curclickpoint);
            #{func}
           });|)
      end
      
      def _mobile_loading(text,theme,html)
        html = %Q|$.mobile.loading('show',{text: '#{text}',textVisible:true,theme:'#{theme}',html: "#{html}"});|
        html.html_safe
      end

      def loading(source, target)
        html = _script(%Q|$('\##{source}').click(function(){$('\##{target}').html('#{escape_javascript(image_tag("ajax-loader.gif"))}')})|)
        html.html_safe
      end

      def loading_hover(source, target)
        html = _script(%Q|$('\##{source}').mouseover(function(){$('\##{target}').html('#{escape_javascript('<i class="icon-spinner icon-spin icon-large"></i>')}')})|)
        html.html_safe
      end
    end
  end
end
