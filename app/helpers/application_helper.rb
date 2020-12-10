module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: 'bg-primary-600 border-l-4 border-primary-900 text-white',
      error:  'bg-red-400 border-l-4 border-red-700 text-black',
      info:   'bg-yellow-300 border-l-4 border-yellow-400 text-black',
      alert:   'bg-yellow-300 border-l-4 border-yellow-400 text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def tailwind_classes_redo(type)
    case type
    when "notice"
      'bg-primary-600 border-l-4 border-primary-900 text-white'
    when "error"
      "bg-red-400 border-l-4 border-red-700 text-black"
    when "info" || "alert"
      "bg-yellow-300 border-l-4 border-yellow-400 text-black"
    end
  end

  def tailwind_text_for(flash_type)
    {
      notice: 'text-white',
      error:  'text-black',
      info:   'text-black',
      alert:   'text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
