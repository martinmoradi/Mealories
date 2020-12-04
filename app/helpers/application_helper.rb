module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: "bg-primary-500 border-l-4 border-primary-800 text-white",
      error: "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
