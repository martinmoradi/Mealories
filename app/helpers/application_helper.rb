module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: 'border-l-4 border-primary-900 bg-primary-600 text-white',
      error: 'bg-red-400 border-l-4 border-red-700 text-black',
      info: 'bg-yellow-300 border-l-4 border-yellow-400 text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def tailwind_text_for(flash_type)
    {
      notice: 'text-white',
      error: 'text-black',
      info: 'text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
