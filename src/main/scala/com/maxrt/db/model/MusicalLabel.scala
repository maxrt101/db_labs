package com.maxrt.db.model

import com.maxrt.db.{Table, Model}

@Table("musical_label")
class MusicalLabel(var id: Int = 0, var name: String = "") extends Model {
  override def toString(): String = s"MusicalLabel($id, $name)"

  def getField(name: String): Any = name match {
    case "id"   => id
    case "name" => this.name
  }

  def setField(name: String, value: AnyRef): Unit = name match {
    case "id"   => id = value.asInstanceOf[Int]
    case "name" => this.name = value.asInstanceOf[String]
  }
}
