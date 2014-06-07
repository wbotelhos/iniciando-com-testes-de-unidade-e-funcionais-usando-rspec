# coding: utf-8

class Article < ActiveRecord::Base
  validates :title , presence: true

  def self.language(title)
    return 'Ruby' if title =~ /.*ruby.*/i
    return 'Java' if title =~ /.*java.*/i

    'Ops! Não é um artigo sobre programação.'
  end

  def self.slug(text)
    text.downcase.gsub /\s/, '-'
  end
end
