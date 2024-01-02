class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      #Datos filiales
      t.string :name
      t.string :lastname
      t.integer :dni 
      t.date :birth_date 

      #Datos de composicion familiar (hijos, pareja/s, padres, hermanos)
      t.integer :children, :null => true
      t.string :partner, :null => true 
      t.string :parents, :null => true 
      t.string :siblings, :null => true 

      #Datos de contacto y localizacion (direccion, telefono,)
      t.string :address, :null => true
      t.string :phone, :null => true

      #Antecedentes familiares (enfermedades padecidas por los padres y hermanos)
      t.text :family_history , :null => true

      #Antecedentes personales (etiquetas con enfermeddes o grupos de enfermedades)
      t.text :personal_history , :null => true

      #Ocupacion (etiquetas con ocupacioens)
      t.string :occupation, :null => true

      #Habitos (alimentacion, ejercicio, consumo de sustancias, actividad sexual, )
      t.string :diet, :null => true
      t.string :exercise, :null => true
      t.string :substance_use , :null => true
      t.string :sexual_activity, :null => true
      

      #historial de consultorio/internaciones/etc... solo texto para registrar el motivo de consulta, enfermedad actual, diagnostico presuntivo y tratamiento aplicado o seguimiento del mismo
      t.string :consult_record, :null => true

      t.timestamps
    end
  end
end
