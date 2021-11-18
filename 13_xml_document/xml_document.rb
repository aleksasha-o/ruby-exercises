class XmlDocument
  attr_accessor :indentation

  def initialize(indentation = false)
    @indentation = indentation
    @indent_level = -1
  end

  def method_missing(method_name, **hash)
    if hash.empty? && !block_given?
      "#{indent("+")}<#{method_name}/>#{indent("n")}"
    elsif !block_given?
      "#{indent("+")}<#{method_name} #{hash.keys.first}='#{hash.values.first}'/>#{indent("n")}"
    else
      "#{indent("+")}<#{method_name}>#{indent("n")}#{yield}#{indent("-")}</#{method_name}>#{indent("n")}"
    end
  end

  def indent(sym)
    if @indentation
    case sym
    when "+"
      @indent_level += 1
      "  " * @indent_level
    when "-"
      @indent_level -= 1
      "  " * @indent_level
    when "n"
      "\n"
    end
    end
  end
end
  #
  # def indent_minus
  #   @indent_level -= 1
  #   "  " * @indent_level
  # end


  #
  # def checker(indentation, tag, name, &block)
  #   puts indentation
  #   case
  #   when indentation == false
  #     if name == '' && block.nil?
  #      "<#{tag}/>"
  #      elsif block.nil?
  #      "<#{tag} name='#{name}'/>"
  #      else
  #      "<#{tag}>#{yield}</#{tag}>"
  #     end
  #   when indentation == true
  #     if name == '' && block.nil?
  #       "<#{tag}/>\n"
  #     elsif block.nil?
  #       "<#{tag} name='#{name}'/>\n"
  #     else
  #       "<#{tag}>\n#{yield}</#{tag}>\n"
  #     end
  #   end
  # end

  # def hello(name:'', &block)
  #   checker(@indentation, 'hello', name, &block)
  # end

  # def goodbye(name:'', &block)
  #   checker(@indentation, 'goodbye', name, &block)
  # end
  #
  # def come_back(name:'', &block)
  #   checker(@indentation, 'come_back', name, &block)
  # end
  #
  # def ok_fine(be:'', &block)
  #   if be == '' && block.nil?
  #     "<ok_fine/>"
  #   elsif block.nil?
  #     "<ok_fine be='#{be}'/>"
  #   else
  #     "<ok_fine>#{yield}</ok_fine>"
  #   end
  # end