class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      #Datos filiales
      t.string :name
      t.string :lastname
      t.integer :dni
      t.date :birth_date

      #Datos de composicion familiar

      #Datos de contacto y localizacion 

      #Antecedentes familiares 

      #Antecedentes personales

      #Ocupacion

      #Habitos




      t.timestamps
    end
  end
end
