# coding: utf-8
module WikiHelper

  def navigation_menu_for_revision
    menu = []
    menu << forward
    menu << back_for_revision if @revision_number > 1
    menu << current_revision
    menu << see_or_hide_changes_for_revision if @revision_number > 1
    menu << history if @page.rev_ids.size > 1
    menu << rollback
    menu
  end

  def navigation_menu_for_page
    menu = []
    menu << edit_page
    menu << edit_web if @page.name == "HomePage"
    if @page.rev_ids.size > 1
      menu << back_for_page
      menu << see_or_hide_changes_for_page
    end
    menu << history if @page.rev_ids.size > 1
    menu
  end

  def edit_page
    link_text = (@page.name == "HomePage" ? 'Редактировать HomePage' : 'Редактировать')
    link_to(link_text, {:web => @web.address, :action => 'edit', :id => @page.name},
        {:class => 'navlink', :accesskey => 'E', :id => 'edit', :rel => 'nofollow'})
  end

  def edit_web
    link_to('Настройки', {:web => @web.address, :action => 'edit_web'},
        {:class => 'navlink', :accesskey => 'W', :id => 'edit_web', :rel => 'nofollow'})
  end

  def history
    link_to_history(@page, 'История изменений',
        {:class => 'navlink', :accesskey => 'S', :id => 'history', :rel => 'nofollow'})
  end

  def forward
    if @revision_number < @page.rev_ids.size - 1
      link_to('Вперед по времени',
          {:web => @web.address, :action => 'revision', :id => @page.name, :rev => @revision_number + 1},
          {:class => 'navlink', :accesskey => 'F', :id => 'to_next_revision', :rel => 'nofollow'}) +
          " <span class='revisions'>(#{@revision.page.rev_ids.size - @revision_number} еще)</span> ".html_safe
    else
        link_to('Вперед по времени', {:web => @web.address, :action => 'show', :id => @page.name},
            {:class => 'navlink', :accesskey => 'F', :id => 'to_next_revision', :rel => 'nofollow'}) +
            " <span class='revisions'>(на последнюю)</span>".html_safe
    end
  end

  def back_for_revision
    link_to('Назад по времени',
        {:web => @web.address, :action => 'revision', :id => @page.name, :rev => @revision_number - 1},
        {:class => 'navlink', :id => 'to_previous_revision', :rel => 'nofollow'}) +
        " <span class='revisions'>(#{@revision_number - 1} еще)</span>".html_safe
  end

  def back_for_page
    link_to('Назад по времени',
        {:web => @web.address, :action => 'revision', :id => @page.name,
        :rev => @page.rev_ids.size - 1},
        {:class => 'navlink', :accesskey => 'B', :id => 'to_previous_revision', :rel => 'nofollow'}) +
        " <span class='revisions'>(#{@page.rev_ids.size - 1} #{@page.rev_ids.size - 1 == 1 ? 'версия' : 'версии'})</span>".html_safe
  end

  def current_revision
    link_to('Последняя версия', {:web => @web.address, :action => 'show', :id => @page.name},
        {:class => 'navlink', :id => 'to_current_revision'})
  end

  def see_or_hide_changes_for_revision
    link_to(@show_diff ? 'Скрыть изменения' : 'Показать изменения',
        {:web => @web.address, :action => 'revision', :id => @page.name, :rev => @revision_number,
         :mode => (@show_diff ? nil : 'diff') },
        {:class => 'navlink', :accesskey => 'C', :id => 'see_changes', :rel => 'nofollow'})
  end

  def see_or_hide_changes_for_page
    link_to(@show_diff ? 'Скрыть изменения' : 'Показать изменения',
        {:web => @web.address, :action => 'show', :id => @page.name, :mode => (@show_diff ? nil : 'diff') },
        {:class => 'navlink', :accesskey => 'C', :id => 'see_changes', :rel => 'nofollow'})
  end

  def rollback
    link_to('Откатить изменения',
        {:web => @web.address, :action => 'rollback', :id => @page.name, :rev => @revision_number},
        {:class => 'navlink', :id => 'rollback', :rel => 'nofollow'})
  end

end
