# -*- coding: UTF-8 -*-
module Xvp
  module Encryption

  def self.encrypt_vnc(password)
    key = [0xc1, 0x24, 0x08, 0x99, 0xc2, 0x26, 0x07, 0x05]
    des = OpenSSL::Cipher::Cipher.new("des-ecb")
    des.key = key.map {|b| b.chr}.join

    des.update(password).unpack('H*').first
  end

  def self.encrypt_pool(password)
      (16 - password.length).times { password << "\0"}
      key = [0xcc, 0x10, 0x10, 0x58, 0xbe, 0x03, 0x07, 0x66]
      des = OpenSSL::Cipher::Cipher.new("des-cbc")
      des.key = key.map {|b| b.chr}.join
      des.encrypt
      # Order matters!
      encrypt_last_part = des.update(password[8..15])
      encrypt_first_part = des.update(password[0..7])
      (encrypt_first_part + encrypt_last_part).unpack('H*').first
  end
end