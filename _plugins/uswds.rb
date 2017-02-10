module USWDS

  def contains_url(top, url, rule=nil)
    return url === top || (
      rule == 'contains' and top.start_with?(url)
    )
  end

  def resolve_permalink(href, source=nil)
    if source.is_a?(Array)
      pages = source
    elsif source.is_a?(String)
      pages = @context.registers[:site][source.to_sym]
    else
      pages = @context.registers[:site].pages
    end
    pages
      .select { |page| page.permalink == href }
      .first
  end

end

Liquid::Template.register_filter(USWDS)
