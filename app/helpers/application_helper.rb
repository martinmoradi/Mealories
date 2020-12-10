module ApplicationHelper
  def tailwind_text_for(flash_type)
    {
      notice: "text-white",
      error: "text-black",
      info: "text-black",
      alert: "text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
